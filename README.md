<div align="center"><h1>Database Management System</h1></div>

<div align="center"><img src="./doc/hello.gif" width="100%" height="100%"></div>


## Windows 🎬

### Special Requisite
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
    <p>PowerShell Core: <a href="https://apps.microsoft.com/detail/9MZ1SNWT0N5D" target="_blank">pwsh</a></p>
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

`./run.ps1` or `pwsh run.ps1` or `& (Join-Path (Get-Location) "run.ps1")`



```pwsh
./run.ps1
```

<div align="center"><img src="./doc/win/mysql-default.gif" width="100%" height="100%"></div>


```pwsh
./run.ps1 -config
```


<div align="center"><img src="./doc/win/mysql-manual.gif" width="100%" height="100%"></div>


Direct interact with SQL Shell after executing code

```pwsh
./run.ps1 -it
```




<!-- <div align="center"><h4>PostgreSQL</h4></div> -->



## Unix 🎥

Comming Soon

### Usage

```sh
./run.sh
```
or

```sh
sh run.sh
```
