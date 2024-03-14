# Use Red Hat Universal Base Image 9 Minimal
FROM registry.access.redhat.com/ubi9/ubi-minimal:9.3-1612

# Maintainer label is deprecated; using label for metadata is recommended
LABEL maintainer="jmorenas" \
      description="OpenTofu and Ansible on minimal UBI 9" \
      ansible_version="${ANSIBLE_VERSION}" \
      opentofu_version="${OPENTOFU_VERSION}"

# Build arguments with default versions, can be overridden during build
ARG ANSIBLE_VERSION=2.15.9
ARG OPENTOFU_VERSION=1.6.2

# Install dependencies in a single RUN layer to reduce image size
# Install 'unzip' required for extracting OpenTofu
RUN microdnf --nodocs -y update && \
    microdnf --nodocs -y install ca-certificates openssl unzip python3-pip && \
    pip3 install --no-cache-dir ansible-core==${ANSIBLE_VERSION} && \
    microdnf clean all

# Use curl to download OpenTofu, then extract and clean up in one RUN to keep layer size down
RUN curl -fsSL https://github.com/opentofu/opentofu/releases/download/v${OPENTOFU_VERSION}/tofu_${OPENTOFU_VERSION}_linux_amd64.zip -o /tmp/tofu.zip && \
    unzip /tmp/tofu.zip -d /usr/local/bin/ && \
    chmod +x /usr/local/bin/tofu && \
    rm /tmp/tofu.zip

# Non-root user for better security
USER 1001

# Set a working directory
WORKDIR /workspace

RUN chown -R 1001:1001 /workspace && \
    chmod 755 /workspace

# │ Error while installing hashicorp/aws v5.40.0: mkdir .terraform: permission denied

# Default command to run when starting the container
ENTRYPOINT ["/usr/local/bin/tofu"]
CMD ["--help"]
