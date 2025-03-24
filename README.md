# Talos Kubernetes Cluster on Proxmox

Work in progress. This is an early prototype. Features may change.

This project provides Terraform configurations to automatically deploy a Talos-based Kubernetes cluster on Proxmox VE. It creates a highly secure, minimal, and immutable Kubernetes cluster using Talos Linux as the operating system.

## Features

- Automated deployment of Talos Linux-based Kubernetes cluster
- Support for control plane and worker nodes
- Configurable number of worker nodes
- Secure cluster configuration with machine secrets
- Automatic generation of kubeconfig and talosconfig
- Health monitoring of the cluster
- Integration with Proxmox VE for VM management

## Prerequisites

- Proxmox VE server
- Terraform installed
- SSH access to Proxmox host
- Proxmox API token with appropriate permissions

## Project Structure

```
.
├── main.tf                 # Main Terraform configuration and provider setup
├── variables.tf           # Variable definitions
├── providers.tf           # Provider configurations
├── proxmox-vm.tf         # Proxmox VM resource definitions
├── proxmox-image-file.tf # Proxmox image file handling
├── talos-cluster.tf      # Talos cluster configuration
├── terraform.tfvars.example # Example variables file
└── templates/            # Template files for Talos configuration
```

## Configuration

1. Copy `terraform.tfvars.example` to `terraform.tfvars`:

   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

2. Edit `terraform.tfvars` with your specific values:
   - `proxmox_endpoint`: Your Proxmox server URL
   - `api_token`: Your Proxmox API token
   - `private_key`: SSH private key for Proxmox access
   - `cluster_name`: Name for your Kubernetes cluster
   - `worker_count`: Number of worker nodes to create
   - IP addresses for control plane and worker nodes

## Usage

1. Initialize Terraform:

   ```bash
   terraform init
   ```

2. Review the planned changes:

   ```bash
   terraform plan
   ```

3. Apply the configuration:

   ```bash
   terraform apply
   ```

4. After successful deployment, you'll receive:
   - `talosconfig`: Configuration for Talos CLI
   - `kubeconfig`: Kubernetes cluster access configuration

## Cluster Architecture

The cluster consists of:

- 1 Control Plane node
- Configurable number of worker nodes (default: 1)
- All nodes run Talos Linux
- Secure communication between nodes
- Automated bootstrap process

## Security Features

- Minimal attack surface with Talos Linux
- Immutable operating system
- Secure boot support
- Encrypted communication
- API token-based authentication
- SSH key-based access

## Maintenance

To update the cluster:

1. Modify the `talos_version` variable if needed
2. Run `terraform plan` to review changes
3. Apply changes with `terraform apply`

## Cleanup

To destroy the cluster:

```bash
terraform destroy
```

## Notes

- Ensure your Proxmox server has sufficient resources for the cluster
- The control plane node requires at least 2GB RAM and 2 CPU cores
- Worker nodes can be configured based on your workload requirements
- All IP addresses must be within your network's DHCP range or statically assigned

## License

This project is open source and available under the MIT License.
