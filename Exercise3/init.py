from IPython.display import HTML, display, Latex
from ipywidgets import interact, interactive, fixed, interact_manual, widgets

import numpy as np
import pandas as pd
import math 
import torch, torch.nn as nn, torch.nn.functional as F

import matplotlib.pyplot as plt
import seaborn as sns

sns.set(style="whitegrid", palette="deep")
plt.rc('figure', figsize = (10,10))
plt.rc('font', size=16)
plt.rc('figure', titlesize=20)
plt.rc('axes', labelsize=16)
plt.rc('ytick', labelsize=14)
plt.rc('xtick', labelsize=14)
plt.rc('legend', fontsize=14)

display(HTML(filename='../custom.html'))
display(Latex("""$$
\\require{ams}
\\require{boldsymbol}
\\newcommand{\\rvar}[1]{\\textrm{#1}}
\\newcommand{\\rvec}[1]{\\mathbf{#1}}
\\renewcommand{\\vec}[1]{\\boldsymbol{#1}}
\\newcommand{\\tens}[1]{\\boldsymbol{\\mathsf{#1}}}
\\newcommand{\\tensel}[1]{\\mathsf{#1}}
\\newcommand{\\st}[1]{\\mathcal{#1}}
\\newcommand{\\diag}[1]{\\textrm{diag}(\\vec{#1})}
$$"""))

# plot vectors of a 2D tensor (matrix)
def plot2d(tensor):
    plt.figure(figsize=(5,5))
    o = torch.zeros(tensor.shape)
    print('Plotting tensor with dim: {} and shape: {}'.format(tensor.dim(),tensor.shape))
    plt.quiver(*o, *tensor, angles='xy', scale_units='xy', scale=1, color=['r','g','b'])
    mx = torch.max(tensor) if torch.max(tensor) > abs(torch.min(tensor)) else abs(torch.min(tensor))
    plt.xlim(-mx, mx)
    plt.ylim(-mx, mx)
