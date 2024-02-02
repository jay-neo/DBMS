<div align="center"><h1>Database Management System</h1></div>


## Windows 🎬

### Prerequisite
<details>
    <summary>1. A Very Nice Terminal 🤞</summary>
    <p>Nearest Example: <a href="https://apps.microsoft.com/detail/9N0DX20HK701" target="_blank">Windows Terminal</a></p>
    <pre><code>
    if (-not (Get-Command wt.exe -ErrorAction SilentlyContinue)) {
        winget install -e --id Microsoft.WindowsTerminal --source winget --silent
    }
    </code></pre>
</details>

<details>
    <summary>2. PowerShell Core 🐱‍👤</summary>
    <p><a href="https://apps.microsoft.com/detail/9MZ1SNWT0N5D" target="_blank">pwsh</a></p>
    <pre><code>
    if (-not (Get-Command pwsh.exe -ErrorAction SilentlyContinue)) {
        winget install --id Microsoft.Powershell --source winget --silent
    }
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
    </code></pre>
</details>

<details>
    <summary>3. One Nerd Font ✨</summary>
    <pre><code>
    if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
        winget install -e --id Git.Git  --source winget --silent
    }
    git clone --filter=blob:none --sparse https://github.com/ryanoasis/nerd-fonts.git
    cd nerd-fonts
    ./install.ps1 Hack
    </code></pre>
</details>

<details>
    <summary>4. A Hot Database 🤗</summary>
    <details>
        <summary>Choice 1. <a href="https://dev.mysql.com/downloads/installer/" target="_blank">MySQL</a></summary>
        <pre><code>
        if (-not (Get-Command mysql -ErrorAction SilentlyContinue)) {
            winget install -e --id Oracle.MySQL --silent
        }
        </code></pre>
    </details>
    <details>
        <summary>Choice 2. <a href="https://www.postgresql.org/download/windows/" target="_blank">PostgreSQL</a></summary>
        <pre><code>
        if (-not (Get-Command psql -ErrorAction SilentlyContinue)) {
            winget install -e --id PostgreSQL.PostgreSQL --silent
        }
        </code></pre>
    </details>
</details>



### Usage

```pwsh
./run.ps1
```

or

```pwsh
pwsh run.ps1
```

#### Initial Configuration

<div align="center"><b>MySQL</b></div>



<div align="center"><img src="./doc/hello.gif" width="100%" height="100%"></div>


<!-- <div align="center"><b>PostgreSQL/<b></div> -->




#### Manual Configuration


<div align="center"><b>MySQL</b></div>

<div align="center"><img src="./doc/hello.gif" width="100%" height="100%"></div>



<!-- <div align="center"><b>PostgreSQL</b></div> -->


#### Debuging


```pwsh
./run.ps1 -debug
```








## Linux 🎥

Comming Soon

### Usage

```sh
./run.sh
```
or

```sh
sh run.sh
```
