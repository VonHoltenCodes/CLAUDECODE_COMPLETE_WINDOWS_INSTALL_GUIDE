@echo off
REM Claude Code Safe Launcher for Windows
REM This script ensures Claude Code launches from a safe directory

echo Claude Code Safe Launcher
echo ========================

REM Check if ClaudeWorkspace exists, create if not
if not exist "C:\ClaudeWorkspace" (
    echo Creating C:\ClaudeWorkspace for safe Claude Code usage...
    mkdir "C:\ClaudeWorkspace"
    mkdir "C:\ClaudeWorkspace\Projects"
    mkdir "C:\ClaudeWorkspace\Sandbox"
    echo Workspace created!
)

REM Change to safe directory
cd /d C:\ClaudeWorkspace

echo.
echo Launching Claude Code from: C:\ClaudeWorkspace
echo This is a SAFE location with full capabilities!
echo.
echo To work on a specific project, navigate there after Claude starts.
echo.

REM Launch Claude Code with any arguments passed to this script
wsl claude %*