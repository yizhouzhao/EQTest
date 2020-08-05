import numpy as np

from abc import ABC, ABCMeta, abstractmethod

class AoTNode(ABC):
    """Superclass of AoT.
    """

    levels_next = {"Scene": "Animation",
                   "Animation": "Frame",
                   "Frame": "Layout",
                   }

    def __init__(self, name, level, node_type, is_pg=False):
        self.name = name
        self.level = level
        self.node_type = node_type
        self.children = []
        self.is_pg = is_pg

    def insert(self, node):
        """Used for public.
        Arguments:
            node(AoTNode): a node to insert
        """
        assert isinstance(node, AoTNode)
        assert self.node_type != "leaf"
        #assert node.level == self.levels_next[self.level]
        self.children.append(node)

    def _insert(self, node):
        """Used for private.
        Arguments:
            node(AoTNode): a node to insert
        """
        assert isinstance(node, AoTNode)
        assert self.node_type != "leaf"
        #assert node.level == self.levels_next[self.level]
        self.children.append(node)

    def _resample(self, change_number):
        """Resample the layout. If the number of entities change, resample also the
        position distribution; otherwise only resample each attribute for each entity.
        Arugments:
            change_number(bool): whether to the number has been reset
        """
        assert self.is_pg
        if self.node_type == "and":
            for child in self.children:
                child._resample(change_number)
        else:
            self.children[0]._resample(change_number)

    def __repr__(self):
        return self.level + "." + self.name

    def __str__(self):
        return self.level + "." + self.name


class Scene(AoTNode):
    def __init__(self, name, is_pg=False):
        super(Scene, self).__init__(name, level="Scene", node_type="and", is_pg=is_pg)

    def sample(self):
        """The function returns a separate AoT that is correctly parsed.
        Note that a new node is needed so that modification does not alter settings
        in the original tree.
        Returns:
            new_node(Root): a newly instantiated node
        """
        if self.is_pg:
            raise ValueError("Could not sample on a PG")
        new_node = Scene(self.name, True)
        for child in self.children:
            new_node.insert(child._sample())
        return new_node

    def resample(self, change_number=False):
        self._resample(change_number)

    def prune(self, rule_groups):
        """Prune the AoT such that all branches satisfy the constraints.
        Arguments:
            rule_groups(list of list of Rule): each list of Rule applies to a component
        Returns:
            new_node(Root): a newly instantiated node with branches all satisfying the constraints;
                None if no branches satisfy all the constraints
        """
        new_node = Scene(self.name)
        for structure in self.children:
            if len(structure.children) == len(rule_groups):
                new_child = structure._prune(rule_groups)
                if new_child is not None:
                    new_node.insert(new_child)
        # during real execution, this should never happens
        if len(new_node.children) == 0:
            new_node = None
        return new_node

    def prepare(self):
        """This function prepares the AoT for rendering.
        Returns:
            structure.name(str): used for rendering structure
            entities(list of Entity): used for rendering each entity
        """
        assert self.is_pg
        assert self.level == "Root"
        structure = self.children[0]
        components = []
        for child in structure.children:
            components.append(child)
        entities = []
        for component in components:
            for child in component.children[0].children:
                entities.append(child)
        return structure.name, entities

    ## To do
    def sample_new(self, component_idx, attr_name, min_level, max_level, scene):
        """Sample a new configuration. This is used for generating answers.
        Arguments:
            component_idx(int): the component we will sample
            attr_name(str): name of the attribute to sample
            min_level(int): lower bound of value level for the attribute
            max_level(int): upper bound of value level for the attribute
            root(AoTNode): the answer AoT, used for storing previous value levels for each attribute
        """
        assert self.is_pg
        #self.children[0]._sample_new(component_idx, attr_name, min_level, max_level, scene.children[0])


class Animation(AoTNode):
    '''
    The scene of one person's animations
    '''

    def __init__(self, name, is_pg=False):
        super(Animation, self).__init__(name, level="Animation", node_type="mix", is_pg=is_pg)

    #To do
    def _sample(self):
        if self.is_pg:
            raise ValueError("Could not sample on a PG")
        new_node = Animation(self.name, True)
        for child in self.children:
            new_node.insert(child._sample())
        return new_node

    def _prune(self, rule_groups):
        new_node = Animation(self.name)
        for i in range(len(self.children)):
            child = self.children[i]
            # if any of the components fails to satisfy the constraint
            # the structure could not be chosen
            new_child = child._prune(rule_groups[i])
            if new_child is None:
                return None
            new_node.insert(new_child)
        return new_node

    # To do
    def _sample_new(self, component_idx, attr_name, min_level, max_level, animation):
        self.children[component_idx]._sample_new(attr_name, min_level, max_level, animation.children[component_idx])


class Frame(AoTNode):
    '''
    On Key Frame in Animation
    '''

    def __init__(self, name, is_pg=False):
        super(Frame, self).__init__(name, level="Frame", node_type="mix", is_pg=is_pg)

    @abstractmethod
    def _sample(self):
        pass

    # @abstractmethod
    # def _prune(self, rule_group):
    #     pass
    #
    # @abstractmethod
    # def _sample_new(self, attr_name, min_level, max_level, frame):
    #     pass


class InitFrame(Frame):
    '''
    Initial frame
    '''
    def __init__(self, name, is_pg=False, is_the_first_person = False):
        super(InitFrame, self).__init__(name, is_pg=is_pg)
        self.node_type = "and"
        self.is_the_first_person = is_the_first_person

    def _sample(self):
        if self.is_pg:
            raise ValueError("Could not sample on a PG")
        new_node = InitFrame(self.name, True)
        for child in self.children:
            new_node.insert(child._sample())
        return new_node

class TransitionFrame(Frame):
    '''
    Transition frame in the middle
    '''
    def __init__(self, name, is_pg=False):
        super(TransitionFrame, self).__init__(name, is_pg=is_pg)
        self.node_type = "or"

    def _sample(self):
        if self.is_pg:
            raise ValueError("Could not sample on a PG")
        new_node = InitFrame(self.name, True)
        selected = np.random.choice(self.children)
        new_node.insert(selected._sample())
        return new_node

class FinalFrame(Frame):
    '''
    Last frame
    '''
    def __init__(self, name, is_pg=False):
        super(FinalFrame, self).__init__(name, is_pg=is_pg)
        self.node_type = "and"

    def _sample(self):
        if self.is_pg:
            raise ValueError("Could not sample on a PG")
        new_node = FinalFrame(self.name, True)
        for child in self.children:
            new_node.insert(child._sample())
        return new_node


class RelativeTransform(AoTNode):
    '''
    The scene of one person's relative transform: position, rotation, scale
    '''

    def __init__(self, name, is_pg=False):
        super(RelativeTransform, self).__init__(name, level="Layout", node_type="and", is_pg=is_pg)
        self.position_leaf = PositionLeaf(self.name, False)
        self.rotation_leaf = RotationLeaf(self.name, False)
        self.scale_leaf = ScaleLeaf(self.name, False)

    def _sample(self):
        if self.is_pg:
            raise ValueError("Could not sample on a PG")
        new_node = RelativeTransform(self.name, True)

        #position
        position_leaf = self.position_leaf._sample()
        new_node.children.append(position_leaf)
        new_node.position_leaf = position_leaf

        # rotation
        rotation_leaf = self.rotation_leaf._sample()
        new_node.children.append(rotation_leaf)
        new_node.rotation_leaf = rotation_leaf

        # scale
        scale_leaf = self.scale_leaf._sample()
        new_node.children.append(scale_leaf)
        new_node.scale_leaf = scale_leaf

        return new_node


class PositionLeaf(AoTNode):
    def __init__(self, name, is_pg=False):
        super(PositionLeaf, self).__init__(name, level="Terminal", node_type="leaf", is_pg=is_pg)
        self.relativeXRange = [0, 10]
        self.relativeZRange = [0, 10]
        self.relativePosition = [0, 0]

    def _sample(self):
        if self.is_pg:
            raise ValueError("Could not sample on a PG")

        new_node = PositionLeaf(self.name, True)
        new_node.relativePosition[0] = np.random.randint(self.relativeXRange[0], self.relativeXRange[1])
        new_node.relativePosition[1] = np.random.randint(self.relativeZRange[0], self.relativeZRange[1])

        return new_node

class RotationLeaf(AoTNode):
    def __init__(self, name, is_pg=False):
        super(RotationLeaf, self).__init__(name, level="Terminal", node_type="leaf", is_pg=is_pg)
        self.relativeYRange = [0, 30]
        self.relativeRotation = 0

    def _sample(self):
        if self.is_pg:
            raise ValueError("Could not sample on a PG")

        new_node = RotationLeaf(self.name, True)
        new_node.relativeRotation = np.random.randint(self.relativeYRange[0], self.relativeYRange[1])

        return new_node

class ScaleLeaf(AoTNode):
    def __init__(self, name, is_pg=False):
        super(ScaleLeaf, self).__init__(name, level="Terminal", node_type="leaf", is_pg=is_pg)
        self.relativeScaleRange = [0.5, 1]
        self.relativeRotation = 1

    def _sample(self):
        if self.is_pg:
            raise ValueError("Could not sample on a PG")

        new_node = RotationLeaf(self.name, True)
        new_node.relativeRotation = np.random.uniform(self.relativeScaleRange[0], self.relativeScaleRange[1])

        return new_node


class Pose(AoTNode):
    '''
    The pose of one person
    '''
    def __init__(self, name, is_pg=False):
        super(Pose, self).__init__(name, level="Layout", node_type="and", is_pg=is_pg)

    def _sample(self):
        if self.is_pg:
            raise ValueError("Could not sample on a PG")
        new_node = Pose(self.name, True)
        for child in self.children:
            new_node.insert(child._sample())
        return new_node


class Emotion(AoTNode):
    '''
    The pose of one person
    '''
    def __init__(self, name, is_pg=False):
        super(Emotion, self).__init__(name, level="Layout", node_type="mix", is_pg=is_pg)
        self.eye_leaf = EyeLeaf(name, False)
        self.eyebrow_leaf = EyebrowLeaf(name, False)
        self.mouth_leaf = MouthLeaf(name, False)
        self.cheek_leaf = CheekLeaf(name, False)

    def _sample(self):
        if self.is_pg:
            raise ValueError("Could not sample on a PG")
        new_node = Emotion(self.name, True)

        # eye
        eye_leaf = self.eye_leaf._sample()
        new_node.children.append(eye_leaf)
        new_node.eye_leaf = eye_leaf

        # eyebrow
        eyebrow_leaf = self.eyebrow_leaf._sample()
        new_node.children.append(eyebrow_leaf)
        new_node.eyebrow_leaf = eyebrow_leaf

        # mouth
        mouth_leaf = self.mouth_leaf._sample()
        new_node.children.append(mouth_leaf)
        new_node.mouth_leaf = mouth_leaf

        # cheek
        cheek_leaf = self.cheek_leaf._sample()
        new_node.children.append(cheek_leaf)
        new_node.cheek_leaf = cheek_leaf

        return new_node


class EntityLeaf(AoTNode, metaclass=ABCMeta):
    def __init__(self, name, is_pg=False):
        super(EntityLeaf, self).__init__(name, level="Terminal", node_type="leaf", is_pg=is_pg)
        self.identifiers = []
        self.file_pool = []
        self.selected_file = None

    def _sample(self):
        if self.is_pg:
            raise ValueError("Could not sample on a PG")

        new_node = EntityLeaf(self.name, True)
        self.selected_file = np.random.choice(self.file_pool)

        return new_node


class EyeLeaf(EntityLeaf):
    def __init__(self, name, is_pg=False):
        super(EyeLeaf, self).__init__(name, is_pg)


class EyebrowLeaf(EntityLeaf):
    def __init__(self, name, is_pg=False):
        super(EyebrowLeaf, self).__init__(name, is_pg)


class MouthLeaf(EntityLeaf):
    def __init__(self, name, is_pg=False):
        super(MouthLeaf, self).__init__(name, is_pg)


class CheekLeaf(EntityLeaf):
    def __init__(self, name, is_pg=False):
        super(CheekLeaf, self).__init__(name, is_pg)


class Body(AoTNode):
    '''
    The pose of one person
    '''
    def __init__(self, name, is_pg=False):
        super(Body, self).__init__(name, level="Layout", node_type="mix", is_pg=is_pg)
        self.head_leaf = HeadLeaf(name, False)
        self.chest_leaf = ChestLeaf(name, False)
        self.foot_leaf = FootLeaf(name, False)
        self.arm_leaf = ArmLeaf(name, False)
        self.hand_leaf = HandLeaf(name, False)

    def _sample(self):
        if self.is_pg:
            raise ValueError("Could not sample on a PG")
        new_node = Body(self.name, True)

        # head
        head_leaf = self.head_leaf._sample()
        new_node.children.append(head_leaf)
        new_node.head_leaf = head_leaf

        # chest
        chest_leaf = self.chest_leaf._sample()
        new_node.children.append(chest_leaf)
        new_node.chest_leaf = chest_leaf

        # foot
        foot_leaf = self.foot_leaf._sample()
        new_node.children.append(foot_leaf)
        new_node.foot_leaf = foot_leaf

        # arm
        arm_leaf = self.arm_leaf._sample()
        new_node.children.append(arm_leaf)
        new_node.arm_leaf = arm_leaf

        # hand
        hand_leaf = self.hand_leaf._sample()
        new_node.children.append(hand_leaf)
        new_node.hand_leaf = hand_leaf

        return new_node


class HeadLeaf(EntityLeaf):
    def __init__(self, name, is_pg=False):
        super(HeadLeaf, self).__init__(name, is_pg)


class ChestLeaf(EntityLeaf):
    def __init__(self, name, is_pg=False):
        super(ChestLeaf, self).__init__(name, is_pg)


class FootLeaf(EntityLeaf):
    def __init__(self, name, is_pg=False):
        super(FootLeaf, self).__init__(name, is_pg)


class ArmLeaf(EntityLeaf):
    def __init__(self, name, is_pg=False):
        super(ArmLeaf, self).__init__(name, is_pg)


class HandLeaf(EntityLeaf):
    def __init__(self, name, is_pg=False):
        super(HandLeaf, self).__init__(name, is_pg)


class Relation(AoTNode):
    def __init__(self, name, is_pg=False):
        super(Relation, self).__init__(name, level="Layout", node_type="mix", is_pg=is_pg)
        self.relation_pool = []
        self.generation_pool = []

        self.relation = None
        self.generation = None
        self.attribute = None

    def _sample(self):
        self.relation = np.random.choice(self.relation_pool)
        self.generation = np.random.choice(self.generation_pool)

