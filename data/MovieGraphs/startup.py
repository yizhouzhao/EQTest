# %%
%load_ext autoreload
%autoreload 2

# %%
from typing import List
from GraphClasses import ClipGraph, MovieGraph
import pickle
import os.path as path
from typing import Dict
import matplotlib.pyplot as plt
import networkx as nx


# %% Requirements (DEPRECATED)
# python 3 (should work on most versions!)
# numpy
# networkx=1.11  NOTE: networkx-2 will NOT work because they changed many functions!


# %% read in data, networkx1 version
# with open(path.join('D:\dataset\moviegraph\mg\py3loader', '2017-11-02-51-7637_py3.pkl'), 'rb') as fid:
#     all_mg: Dict[str, MovieGraph] = pickle.load(fid, encoding='latin1')
#     # latin1 is important here

# # all_mg is a dictionary of MovieGraph objects
# # indexed by imdb unique movie identifiers

# %% convert networkx1 to networkx2, part 1, in networkx1
# for _, mg in all_mg.items():
#     print(mg.imdb_key)
#     for _, cg in mg.clip_graphs.items():
#         cg.prepare_migration_save()

# with open('moviegraph.pkl', 'wb') as fid:
#     pickle.dump(all_mg, fid)


# %% read in data, networkx2 version
with open('moviegraph.pkl', 'rb') as fid:
    all_mg: Dict[str, MovieGraph] = pickle.load(fid)

# %% convert networkx1 to networkx2, part 2, in networkx2
# for _, mg in all_mg.items():
#     print(mg.imdb_key)
#     for _, cg in mg.clip_graphs.items():
#         cg.migration_load()

# with open('moviegraph.pkl', 'wb') as fid:
#     pickle.dump(all_mg, fid)
# %%
num_movies = len(all_mg.keys())
print('Found {} movies with graphs'.format(num_movies))


mg = all_mg['tt0109830']  # Forrest Gump
print('Selected movie: {}'.format(mg.imdb_key))
# print()
# print('Cast in this movie:')
# for character in mg.castlist:
#     print(character['chid'], character['name'])

#  mg.clip_graphs is a list of ClipGraph objects
print('Selected one clip graph')
cg: ClipGraph = mg.clip_graphs[0]

# %%
cg.pprint()



# %%
for _, cg in mg.clip_graphs.items():
    print(cg.description)
    for n_idx, n in cg.G.nodes(data=True):
        if n['type'] == 'interaction':
            print({'name': n['name'], 
            'text': n['origtext']})
            # print(n)

# %%
nx.draw(cg.G)

# %%
cg.visualize_graph()

# %%
cg.G.nodes(data='type')

# %%
