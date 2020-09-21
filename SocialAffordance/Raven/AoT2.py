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
        self.root = None
        self.node_dict = {}

    def insert(self, node):
        """Used for public.
        Arguments:
            node(AoTNode): a node to insert
        """
        assert isinstance(node, AoTNode)
        assert self.node_type != "leaf"
        #assert node.level == self.levels_next[self.level]
        self.children.append(node)

    # def _insert(self, node):
    #     """Used for private.
    #     Arguments:
    #         node(AoTNode): a node to insert
    #     """
    #     assert isinstance(node, AoTNode)
    #     assert self.node_type != "leaf"
    #     #assert node.level == self.levels_next[self.level]
    #     self.children.append(node)

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
        self.root = self

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
            new_node.insert(child._sample(new_node))
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
    def _sample(self, root=None):
        if self.is_pg:
            raise ValueError("Could not sample on a PG")
        new_node = Animation(self.name, True)

        if root:
            root.node_dict[new_node.name] = new_node

        for child in self.children:
            new_node.insert(child._sample(root))
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
    def _sample(self, root=None):
        pass

    # @abstractmethod
    # def _prune(self, rule_group):
    #     pass
    #
    # @abstractmethod
    # def _sample_new(self, attr_name, min_level, max_level, frame):
    #     pass


class RegularFrame(Frame):
    '''
    Initial frame
    '''
    def __init__(self, name, is_pg=False, is_the_first_person = False):
        super(RegularFrame, self).__init__(name, is_pg=is_pg)
        self.node_type = "and"
        self.is_the_first_person = is_the_first_person
        self.next_frame_range = [24, 49]
        self.next_frame: int = 24

    def _sample(self, root=None):
        if self.is_pg:
            raise ValueError("Could not sample on a PG")
        new_node = RegularFrame(self.name, True)

        new_node.next_frame = np.random.randint(self.next_frame_range[0], self.next_frame_range[1])

        if root:
            root.node_dict[new_node.name] = new_node

        for child in self.children:
            new_node.insert(child._sample(root))
        return new_node


class RelativeTransform(AoTNode):
    '''
    The scene of one person's relative transform: position, rotation, scale
    '''

    def __init__(self, name, is_pg=False):
        super(RelativeTransform, self).__init__(name, level="Layout", node_type="and", is_pg=is_pg)
        self.position_leaf = PositionLeaf(self.name + "position", False)
        self.rotation_leaf = RotationLeaf(self.name + "rotation", False)
        self.scale_leaf = ScaleLeaf(self.name + "scale", False)

    def _sample(self, root=None):
        if self.is_pg:
            raise ValueError("Could not sample on a PG")
        new_node = RelativeTransform(self.name, True)

        if root:
            root.node_dict[new_node.name] = new_node

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
        self.relativeXRange = [2, 12]
        self.relativeZRange = [0, 3]
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
        self.relativeScale = 1

    def _sample(self):
        if self.is_pg:
            raise ValueError("Could not sample on a PG")

        new_node = RotationLeaf(self.name, True)
        new_node.relativeScale = np.random.uniform(self.relativeScaleRange[0], self.relativeScaleRange[1])

        return new_node

class Motion(AoTNode):
    '''
    The pose of one person
    '''
    def __init__(self, name, is_pg=False):
        super(Motion, self).__init__(name, level="Layout", node_type="and", is_pg=is_pg)

        # selected from file pool
        self.file_pool = []
        self.selected_motion = None

        # sample from model
        self.model = None

        # time control
        self.time_offset_range = [-2, 2]
        self.start_time = 0
        self.end_time = 0


    def _sample(self, root=None, select_from_file=True):
        if self.is_pg:
            raise ValueError("Could not sample on a PG")

        new_node = Motion(self.name, True)
        if select_from_file:
            assert len(self.file_pool) > 0
            new_node.selected_motion = np.random.choice(self.file_pool)

            if root:
                root.node_dict[new_node.name] = new_node

        # sample time
        new_node.start_time = np.random.uniform(self.time_offset_range[0], self.time_offset_range[1])

        return new_node


class Emotion(AoTNode):
    '''
    The pose of one person
    '''
    def __init__(self, name, is_pg=False):
        super(Emotion, self).__init__(name, level="Layout", node_type="mix", is_pg=is_pg)

        # selected from file pool
        self.file_pool = []
        self.   start_emotion = None
        self.end_emotion = None
        self.select_from_file = True

        # sample from V,A,D
        self.start_vad = [0.5, 0.5, 0.5]
        self.end_vad = [0.5, 0.5, 0.5]
        self.value_range = [0, 1]

        # time control
        self.time_offset_range = [-24, 24]
        self.start_time = 0
        self.end_time = 0

    def _sample(self, root=None, select_from_file=True):
        if self.is_pg:
            raise ValueError("Could not sample on a PG")
        new_node = Emotion(self.name, True)

        if self.select_from_file:
            assert len(self.file_pool) > 0
            new_node.start_emotion = np.random.choice(self.file_pool)
            new_node.end_emotion = np.random.choice(self.file_pool)

            if root:
                root.node_dict[new_node.name] = new_node
        else:
            new_node.start_vad[0] = np.random.uniform(self.value_range[0], self.value_range[1])
            new_node.start_vad[1] = np.random.uniform(self.value_range[0], self.value_range[1])
            new_node.start_vad[2] = np.random.uniform(self.value_range[0], self.value_range[1])

            new_node.end_vad[0] = np.random.uniform(self.value_range[0], self.value_range[1])
            new_node.end_vad[1] = np.random.uniform(self.value_range[0], self.value_range[1])
            new_node.end_vad[2] = np.random.uniform(self.value_range[0], self.value_range[1])

        # sample time
        new_node.start_time = np.random.uniform(self.time_offset_range[0], self.time_offset_range[1])

        return new_node


class Relation(AoTNode):
    def __init__(self, name, is_pg=False):
        super(Relation, self).__init__(name, level="Layout", node_type="mix", is_pg=is_pg)
        self.relation_pool = []
        self.generation_pool = []
        self.sex_pool = []

        self.relation = None
        self.generation = None
        self.sex = None
        self.attribute = None


    def _sample(self, root=None):
        if self.is_pg:
            raise ValueError("Could not sample on a PG")

        new_node = Relation(self.name, True)

        if root:
            root.node_dict[new_node.name] = new_node

        new_node.relation = np.random.choice(self.relation_pool)
        new_node.generation = np.random.choice(self.generation_pool)
        new_node.sex = np.random.choice(self.sex_pool)

        return new_node

