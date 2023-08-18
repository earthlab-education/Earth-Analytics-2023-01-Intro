FROM earthlab/earth-analytics-python-env@sha256:7fff6491cf539287ba32a5be4cc0c910ddda4ecaa9aecc03597d599978036e1d

# Make sure the contents of our repo are in ${HOME}
USER root
COPY . ${HOME}
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

# Reset entrypoint
ENTRYPOINT []