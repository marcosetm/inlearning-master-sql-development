import os

BASE_URL = "https://github.com/LinkedInLearning/top-5-things-to-know-in-advanced-sql-4403486/raw/main/"
FILE_NAMES = [
    "Red30TechConferenceSessionInfo.xlsx", 
    "Red30TechConventionAttendees.xlsx",
    "Red30TechEmployeeDirectory.xlsx",
    "Red30TechInventory.xlsx",
    "Red30TechOnlineRetailSales.xlsx",
    "Red30TechSpeakerInfo.xlsx"
    ]
TARGET_PATH = "../data/"

for file in FILE_NAMES:
    url = f"{BASE_URL}{file}"
    print(f"Downloading: {file}")
    os.system(f"curl -L -o {TARGET_PATH}{file} {url}")
    print(f"Saved {TARGET_PATH}{file}")





