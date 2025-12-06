# Learning Linux Command Line

This is the repository for the LinkedIn Learning course **Learning Linux Command Line**. The full course is available from [LinkedIn Learning][lil-course-url].

![Learning Linux Command Line][lil-thumbnail-url]

## Overview

Knowledge of the Linux command line is critical for anyone who uses this open-source operating system. For many tasks, it's more efficient and flexible than a graphical environment. For administrators, it plays a vital role in configuring permissions and working with files. 

In this course, experienced instructor Scott Simpson discusses the basics of setting up your environment and working with the Linux command line using the Bash shell. He focuses on practical Linux commands with examples that help you navigate through the file and folder structure, edit text, and set permissions.

## Course Topics

- **Environment Setup**: Configuring and customizing your shell environment
- **File Navigation**: Working with the file and folder structure using commands like `cd`, `ls`, and `pwd`
- **Text Editing**: Using text editors including nano and Vim
- **File Permissions**: Understanding and managing file and directory permissions
- **Command-Line Tools**: Exploring powerful tools such as:
  - `grep` - Pattern matching and searching
  - `awk` - Text processing and data extraction
  - `sed` - Stream editing and text transformation
- **Output Redirection**: Managing input/output streams and pipes
- **PATH Variable**: Understanding and configuring the command search path
- **Advanced Topics**: Exploring more complex command-line concepts
- **Package Management**: Installing and updating software using package managers

## Project Structure

```
Exercise Files/
├── dupes.txt
├── poems.txt
├── simple_data.txt
├── test.sh
└── departments/
    ├── engineering/
    ├── finance/
    ├── hr/
    ├── marketing/
    └── sales/
```

## Scripts Included

- `security-audit.sh` - Security auditing script
- `create_user.sh` - User creation utility
- `find_users.sh` - User search and listing utility
- `startup.sh` - System startup script

## Project: Real-Time Security Log Triage

This project is centered around a highly efficient Bash script, `security-audit.sh`, designed to quickly scan massive web access logs and flag critical, high-priority security events. It serves as a demonstration of advanced text processing using command-line utilities (`awk`, `grep`) to perform surgical data extraction and counting.

### 🔑 Key Features & Core Logic

| Feature | Tool Used | Description |
|---------|-----------|-------------|
| Rapid Filtering | `awk` | Reads the log file once, filtering out all non-security-related lines to maximize speed. |
| Logic Tagging | `awk` | Tags relevant lines with clear security indicators (AUTH_FAIL, HIGH_RISK_UA) before counting. |
| Precise Counting | `grep -c` | Provides an instant, accurate count of total critical events for quick reporting. |
| Non-Destructive | N/A | The script reads the original log file but does not modify it. |

### 🚨 The Problem I Solved

During a recent review of our web infrastructure, our team lacked a quick, automated way to monitor key security indicators within massive access logs. Manually searching for these events was impossible due to log volume.

The goal was simple: Instantly identify and count two critical, non-negotiable security events:
- **Unauthorized Access Attempts** (HTTP Status Code 401)
- **Traffic from a highly vulnerable User Agent** (specifically Firefox/45.0)

### 🛠️ The Solution: The Command Pipeline

A simple but powerful pipeline handles this logic:

```bash
awk '
  /Firefox\/45\.0/ { print "HIGH_RISK_UA: " $0 }
  $9 == 401 { print "AUTH_FAIL: " $0 }' "$1" | grep -c -E 'HIGH_RISK_UA|AUTH_FAIL'
```

This single line processes the entire log file, tags the critical lines, and then pipes the result to `grep` for a final, instantaneous count.

### ⚙️ Usage

**Prerequisites:**
- A Linux environment (Bash shell) with standard utilities (`awk`, `grep`)

**Grant Execution Permission:**
```bash
chmod +x security-audit.sh
```

**Execute the Script:**
```bash
./security-audit.sh access.log
```

**Example Output:**
```
--- Security Audit Report for access.log ---
3
-------------------------------------
```

## Getting Started

1. Clone this repository
2. Navigate to the project directory
3. Review the course materials and exercise files
4. Execute the scripts as needed for practice

## Files

- `commands.md` - Markdown file with command reference
- `commands.txt` - Text file with command examples
- `hamlet.txt`, `hamlet2.txt` - Sample text files for practice
- `test.txt`, `text1.txt` - Additional test files

## Instructor

**Scott Simpson**  
Senior Staff Instructor

Check out my other courses on [LinkedIn Learning](https://www.linkedin.com/learning/instructors/scott-simpson).

## License

This project is licensed under the terms specified in the LICENSE file.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for contribution guidelines.

[lil-course-url]: https://www.linkedin.com/learning/learning-linux-command-line-14447912?dApp=59033956&leis=LAA
[lil-thumbnail-url]: https://media.licdn.com/dms/image/C4D0DAQGtr8J3i_BSjg/learning-public-crop_288_512/0/1679938026141?e=2147483647&v=beta&t=mAPlrEexRYjAzZqU1Em9kfv9N0pV3GNneO0bk-DdwDk
