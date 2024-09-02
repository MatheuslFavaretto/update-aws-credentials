# Problem

In my daily work routine, while managing operations on AWS, I often need to update my credentials multiple times throughout the day.

# Solution

Below is a simple script that automatically grabs the content from the clipboard and updates the AWS credentials file. By running **up-awscred**.

# Requirements

- Bash
- xclip

# Installation

Run the command below to download the setup file and execute it, simplifying the installation process:

```bash
curl https://raw.githubusercontent.com/MatheuslFavaretto/update-aws-credentials/main/setup.sh | bash
```

# Usage

After installation, simply run the following command:
```bash
up-awscred
```
