import os
import shutil
from glob import glob

# Define the source directories
current_dir = os.getcwd()
lib_dir = os.path.join(current_dir, 'lib')

# Define the destination directory
benches_dir = os.path.join(current_dir, 'benches')

# Get the list of .tla files in the current directory and lib directory
tla_files = glob(os.path.join(current_dir, '*.tla')) + glob(os.path.join(lib_dir, '*.tla'))

# Get the list of subdirectories in the benches directory
subdirs = [os.path.join(benches_dir, d) for d in os.listdir(benches_dir) if os.path.isdir(os.path.join(benches_dir, d))]

# Copy each .tla file to each subdirectory in the benches directory
for subdir in subdirs:
    for tla_file in tla_files:
        shutil.copy(tla_file, subdir)