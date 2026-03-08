# Placement Management System - Installation & Requirements

This document outlines the necessary installation steps and commands to set up the backend environment for the Placement Management System as described in the abstract.

## 1. System Prerequisites

### Python (Backend Logic)
**Windows:**
1. Download the installer from [python.org](https://www.python.org/downloads/).
2. Run the installer and **check the box "Add Python to PATH"**.
3. Verify installation in Command Prompt:
   ```cmd
   python --version
   ```

**macOS/Linux:**
   ```bash
   # macOS (using Homebrew)
   brew install python

   # Linux (Ubuntu/Debian)
   sudo apt update
   sudo apt install python3 python3-pip
   ```

### MySQL (Database)
**Windows:**
1. Download the MySQL Installer from [dev.mysql.com](https://dev.mysql.com/downloads/installer/).
2. Select "Server only" or "Developer Default".
3. During configuration, set a **Root Password** and remember it.

**macOS/Linux:**
   ```bash
   # macOS
   brew install mysql
   brew services start mysql

   # Linux
   sudo apt install mysql-server
   sudo systemctl start mysql
   ```

---

## 2. Project Setup & Installation Commands

### Step 1: Create Project Directory
Open your terminal or command prompt:
```bash
mkdir placement_system_backend
cd placement_system_backend
```

### Step 2: Set up Virtual Environment (Recommended)
It is best practice to use a virtual environment to manage dependencies.

**Windows:**
```cmd
python -m venv venv
venv\Scripts\activate
```

**macOS/Linux:**
```bash
python3 -m venv venv
source venv/bin/activate
```

### Step 3: Install Python Dependencies
We have provided a `requirements.txt` file. Run the following command to install Flask, MySQL connector, and other necessary libraries:

```bash
pip install -r requirements.txt
```

*If you don't have the file yet, the command to install manually is:*
```bash
pip install Flask mysql-connector-python flask-cors flask-mysqldb
```

---

## 3. Database Configuration

### Step 1: Log into MySQL
```bash
mysql -u root -p
# Enter the password you set during installation
```

### Step 2: Create Database and Tables
You can run the provided `database_schema.sql` file or execute these commands manually:

```sql
-- Create the database
CREATE DATABASE placement_system;
USE placement_system;

-- Run the commands from database_schema.sql to create tables
```

To import the schema directly from the command line:
```bash
mysql -u root -p placement_system < database_schema.sql
```

---

## 4. Running the Backend Server

Once everything is installed and the database is set up:

**Windows/macOS/Linux:**
```bash
# Assuming your main file is app.py
python app.py
```

The server will typically start at `http://127.0.0.1:5000`.

---

## 5. Connecting the Flutter Frontend

The Flutter application (Mobile/Web) will communicate with this Python backend via HTTP API calls.
Ensure your Python backend has **CORS (Cross-Origin Resource Sharing)** enabled so the Flutter web app can communicate with it.
