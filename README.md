# vm-health-check
vm-health-check
Here’s a breakdown of the brainstorming process for the script:

### Objective:
To create a shell script that evaluates the health of a virtual machine (VM) based on three parameters:
1. **CPU Usage**
2. **Memory Usage**
3. **Disk Space Usage**

The script should:
- Declare the VM as **HEALTHY** if all parameters are ≤ 60%.
- Declare the VM as **NOT HEALTHY** if any parameter exceeds 60%.
- Provide an optional `explain` argument to detail the reasons for the health status.

---

### Key Components:
1. **CPU Usage Calculation**:
   - Use the `top` command to fetch CPU usage.
   - Extract the percentage of CPU being used.
   - Subtract the idle percentage from 100 to get the actual usage.

2. **Memory Usage Calculation**:
   - Use the `free` command to fetch memory statistics.
   - Calculate the percentage of memory used (`used memory / total memory * 100`).

3. **Disk Space Usage Calculation**:
   - Use the `df` command to fetch disk usage.
   - Extract the percentage of disk space used for the root directory (`/`).

4. **Health Status Logic**:
   - Compare the CPU, memory, and disk usage values against the 60% threshold.
   - If all are ≤ 60%, declare the VM as **HEALTHY**.
   - If any exceed 60%, declare the VM as **NOT HEALTHY**.

5. **Optional `explain` Argument**:
   - If the `explain` argument is passed, provide a detailed breakdown of:
     - CPU usage
     - Memory usage
     - Disk usage
   - If the VM is **NOT HEALTHY**, specify which parameter(s) exceeded the threshold.

---

### Tools and Commands:
- **`top`**: To monitor CPU usage.
- **`free`**: To monitor memory usage.
- **`df`**: To monitor disk space usage.
- **`awk`**: To process and extract specific fields from command output.
- **`sed`**: To clean up output (e.g., remove `%` symbols).

---

### Script Flow:
1. Define functions to calculate CPU, memory, and disk usage.
2. Fetch the usage values for each parameter.
3. Compare the values against the 60% threshold.
4. Print the health status of the VM.
5. If the `explain` argument is provided:
   - Print the detailed usage values.
   - If **NOT HEALTHY**, explain which parameter(s) caused the issue.

---

### Edge Cases:
- Ensure the script handles unexpected output from commands gracefully.
- Handle scenarios where the `explain` argument is not passed.
- Ensure the script works on systems with standard Linux utilities.

---

This brainstorming process ensures the script is modular, efficient, and user-friendly.

Here is a `README.md` file for your script:

```markdown
# VM Health Check Script

This repository contains a shell script to analyze the health of a virtual machine (VM) based on CPU, memory, and disk space usage.

## Features

- **Health Status**:
  - Declares the VM as **HEALTHY** if CPU, memory, and disk usage are all ≤ 60%.
  - Declares the VM as **NOT HEALTHY** if any of these parameters exceed 60%.
- **Detailed Analysis**:
  - When the `explain` argument is passed, the script provides a detailed breakdown of:
    - CPU usage
    - Memory usage
    - Disk usage
  - If the VM is **NOT HEALTHY**, it explains which parameter(s) exceeded the threshold and displays their current usage.

## Usage

1. **Make the script executable**:
   ```bash
   chmod +x vm_health_check.sh
   ```

2. **Run the script**:
   ```bash
   ./vm_health_check.sh
   ```

3. **Run the script with the `explain` argument**:
   ```bash
   ./vm_health_check.sh explain
   ```

   Example output when the VM is **NOT HEALTHY**:
   ```
   VM Health Status: NOT HEALTHY
   Detailed Analysis:
   CPU Usage: 75%
   Memory Usage: 50%
   Disk Usage: 65%
   Reason(s):
   - CPU usage exceeds 60% (Current: 75%).
   - Disk usage exceeds 60% (Current: 65%).
   ```

## Requirements

- A Linux-based system with the following commands available:
  - `top`
  - `free`
  - `df`
  - `awk`
  - `sed`

## Script Details

- **CPU Usage**:
  - Calculated using the `top` command.
  - The script subtracts the idle percentage from 100 to get the CPU usage.

- **Memory Usage**:
  - Calculated using the `free` command.
  - The script computes the percentage of memory used as `(used memory / total memory) * 100`.

- **Disk Usage**:
  - Calculated using the `df` command.
  - The script extracts the percentage of disk space used for the root directory (`/`).

## License

This project is licensed under the MIT License.
```

### Instructions:
1. Save this content as `README.md` in the same directory as your script.
2. Commit it to your repository:
   ```bash
   git add README.md
   git commit -m "Add README.md for VM health check script"
   git push origin main
   ```### Instructions:
1. Save this content as `README.md` in the same directory as your script.
2. Commit it to your repository:
   ```bash
   git add README.md
   git commit -m "Add README.md for VM health check script"
   git push origin main
   ```