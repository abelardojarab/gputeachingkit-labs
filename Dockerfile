
FROM ubuntu:15.10

MAINTAINER Abdul Dakkak <dakkak@illinois.edu>

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
        cmake python cabal-install texlive-xetex texlive-full \
        texlive-latex-recommended texlive-latex-extra \
        haskell-platform
RUN cabal init -n -m && \
    cabal update && \
    retry cabal install pandoc pandoc-citeproc && \
    /usr/src/cabal/bootstrap.sh 
# echo 'export PATH=$PATH:$HOME/.cabal/bin' >> ~/.profile && \
# echo 'export PATH=$PATH:$HOME/.cabal/bin' >> ~/.bashrc && \
# echo 'export PATH=$PATH:$HOME/.cabal/bin' >> ~/.bash_profile
