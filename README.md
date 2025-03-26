# Be A Man Level II w/ Terraform Code and Variables

This repository contains Terraform configurations for deploying a comprehensive Google Cloud Platform (GCP) infrastructure. The setup includes:

- **Virtual Private Cloud (VPC)**: A custom VPC network.
- **Subnets**: Subnetworks across multiple regions.
- **Firewall Rules**: Configurations to control inbound and outbound traffic.
- **VM Instances**: Virtual machines deployed within the subnets.

---

## 🔧 Prerequisites

Before proceeding, ensure you have the following installed and configured:

- [**Terraform**](https://www.terraform.io/downloads.html)
- [**Google Cloud SDK**](https://cloud.google.com/sdk/docs/install)
- **GCP Project** with billing enabled
- **Service Account Key**: JSON key for a service account with the necessary permissions

---

## 📁 Repository Structure

The configuration files are organized as follows:

| File Name            | Purpose                                      |
|----------------------|----------------------------------------------|
| `1-providers.tf`     | Configures the GCP provider                  |
| `2-variables.tf`     | Defines variables used throughout the setup  |
| `3-vpc.tf`           | Creates the VPC network                      |
| `4-subnets.tf`       | Sets up subnets within the VPC              |
| `5-firewall.tf`      | Establishes firewall rules                  |
| `6-vm-instances.tf`  | Deploys VM instances in the subnets         |
| `7-outputs.tf`       | Displays output values after deployment     |

---

## 🚀 Setup Instructions

1. **Clone the Repository**

   ```bash
   git clone https://github.com/tiqsclass6/gcp-be-a-man-level-2.git
   cd gcp-be-a-man-level-2
   code .
   ```

2. **Initialize Terraform**

   Initialize the working directory and download necessary plugins:

   ```bash
   terraform init
   ```

3. **Review and Customize Variables**

   Edit `2-variables.tf` to set your desired project ID, region, subnets, etc.

4. **Format Terraform Configuration**

   Format your configuration files for readability and consistency:

   ```bash
   terraform fmt
   ```

5. **Validate the Configuration**

   Ensure the Terraform files are syntactically valid:

   ```bash
   terraform validate
   ```

6. **Plan the Deployment**

   Preview the changes Terraform will make:

   ```bash
   terraform plan
   ```

7. **Apply the Deployment**

   Deploy the infrastructure:

   ```bash
   terraform apply
   ```

   Type `yes` to confirm and proceed.

8. **Access Deployed Resources**

   Terraform will display outputs from `7-outputs.tf`, such as VM internal IP addresses.

---

## 🔐 Security Considerations

- **SSH Access**: SSH is configured to work via [Identity-Aware Proxy (IAP)](https://cloud.google.com/iap). Ensure IAP is enabled and proper IAM roles are granted.
- **ICMP Traffic**:
  - Internal: Allowed for inter-subnet communication
  - External: Denied to improve security posture

---

## 🌐 Network Validation

After deployment, validate internal connectivity between your VM instances:

1. **Click the SSH Button**:
   - In the Google Cloud Console, navigate to the **VM instances** page.
   - Click the **SSH** button next to the first VM instance.
   - **Note**: Ensure your browser allows pop-ups, as the SSH session opens in a new window.

2. **Ping Internal IPs**:
   - Once connected to the VM, run the following command to ping another VM's internal IP address:

     ```bash
     ping <INTERNAL-IP>
     ```

   - Let the ping run approximately 10 times.
   - Press `Ctrl + Z` to stop the ping.

3. **Repeat for Other Regions**:
   - Repeat the above process for each VM instance in the other two regions.
   - SSH into each instance and ping the internal IPs of the remaining VMs.

This confirms that internal communication is functioning correctly across all regional subnets.

---

## 📸 Screenshot Your Work

To verify and document successful deployment and validation, take the following screenshots:

1. **Three SSH Terminal Windows**:
   - One screenshot per region showing successful `ping` output between VMs.

2. **VM Instances Page**:
   - Show all deployed VM instances in the Google Cloud Console.

3. **Subnets Page**:
   - Show all configured subnets under your VPC network.

4. **Firewall Rules Page**:
   - Display the firewall rules, particularly those allowing IAP SSH and internal ICMP.

5. **VS Code - `firewall.tf` File**:
   - Open and screenshot the `5-firewall.tf` file in Visual Studio Code.

6. **Terraform Apply Output**:
   - Terminal window showing the successful execution of `terraform apply`.

7. **Terraform Destroy Output**:
   - Terminal window showing the successful execution of `terraform destroy`.

---

## 🧹 Cleanup

To tear down the infrastructure and avoid billing charges:

```bash
terraform destroy
```

Type `yes` when prompted to confirm.

---

## 🛠️ Common Troubleshooting Techniques

- **Authentication Issues**:
  - Ensure your service account key is valid and correctly referenced.
  - Run `gcloud auth application-default login` if using ADC (Application Default Credentials).

- **Permission Errors**:
  - Make sure the service account has sufficient IAM roles (e.g., Compute Admin, Network Admin).

- **Terraform Init Errors**:
  - Check your internet connection.
  - Delete the `.terraform` directory and re-run `terraform init`.

- **Resource Already Exists**:
  - Verify the resource wasn’t manually created before running Terraform.
  - Use `terraform state list` and `terraform state rm <resource>` to reconcile state.

- **API Not Enabled**:
  - Make sure all required Google Cloud APIs (Compute Engine, IAM, etc.) are enabled for your project.

- **Region/Zone Availability**:
  - Ensure you are using valid regions/zones for your resource types.

---

## 📚 Additional Resources

- [Terraform Documentation](https://www.terraform.io/docs)
- [Google Cloud Terraform Provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs)
- [Google Cloud Identity-Aware Proxy](https://cloud.google.com/iap)
