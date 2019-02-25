# MPESE and networkx

## Introduction

A project to learn networkx (https://networkx.github.io/) while playing
MPESE data.

The `create_graph.xql` was used to create `mpese.graphml` via executing
against the production MPESE server.

[Overview](mpese.ipynb)

## Reloading modules

Code is initially developed via the Python console and it is necessary to
reload modules for the changes to take affect. For example:

```
import mpese_utilities as mpese
```

We can reload in the console via:

```
from importlib import reload
reload(mpese)
```