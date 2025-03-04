
#!/usr/bin/env python3
import subprocess
import time

MAX_RETRIES = 5  # Maximum number of retries
RETRY_DELAY = 5  # Delay between retries in seconds

def extend_management_node():
    message = "I need extra time because I am developing an algorithm to keep the central management node active as long as the last experiment is running. This prevents database loss."

    cmd = ["extendExperiment", "-m", message, "UCY-CS499-DC,management-node", "12"]

    attempt = 0
    while attempt < MAX_RETRIES:
        try:
            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).decode("utf-8").strip()

            if output:  # Ensure output is not empty
                print("Extend Experiment Output:")
                print(output)
                return  # Exit successfully

            else:
                print(f"Attempt {attempt + 1}: Received empty response. Retrying in {RETRY_DELAY} seconds...")

        except subprocess.CalledProcessError as e:
            error_message = e.output.decode("utf-8").strip()
            if "SSL: UNEXPECTED_EOF_WHILE_READING" in error_message:
                print(f"Attempt {attempt + 1}: SSL error encountered. Retrying in {RETRY_DELAY} seconds...")
            else:
                print("Error calling extendExperiment:")
                print(error_message)
                return  # Exit if it's a non-retryable error

        attempt += 1
        time.sleep(RETRY_DELAY)  # Wait before retrying

    print("Max retries reached. The experiment extension request may have failed.")

if __name__ == '__main__':
    extend_management_node()
