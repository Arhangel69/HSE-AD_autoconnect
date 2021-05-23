# HSE-AD_autoconnect

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

## Install HSE-AD_autoconnect for Windows 10

### 1. Setup hseAD_script.ps1

### 1.1 Check ExecutionPolicy

Open PowerShell as administrator and execute

`Get-ExecutionPolicy`

If the result is "Restricted" or "AllSigned", then execute:

`Set-ExecutionPolicy RemoteSigned` and accept.

### 1.2 Setup script

Open `hseAD_script.ps1` and change `<path-to-chrome.exe>` to the your full system path.

The default path is most often `C:\Program Files (x86)\Google\Chrome\Application\chrome.exe`

### 2. Installing the extension to the browser

#### Google Chrome

1. Open Google Chrome and go to chrome://extensions/
2. Turn on `Developer mode`
3. Select `Load unpacked extension`
4. Select the folder where `manifest.json` is located.

### 3. Autorun script at login

#### 3.1 Setup task

Open `HSE-AD autoconnect.xml` and change `<path-to-hseAD_script.ps1>` to the full path where `hseAD_script.ps1` is located.

If you want to run the script in "invisible" mode, add `-nologo -noninteractive -windowStyle hidden` before `-command`.

#### 3.2 Setup autorun

1. Open Task Scheduler
2. Select `Import task...`
3. Choose `HSE-AD autoconnect.xml`
4. Accept all.

### 4. Reboot your PC
