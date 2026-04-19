# Force load necessary Windows Forms and Drawing assemblies
Add-Type -TypeDefinition @"
using System;
using System.Windows.Forms;
using System.Drawing;
public class MainForm : Form {
    public MainForm() {
        this.Text = "Dingle Premium Utility";
        this.Size = new System.Drawing.Size(400, 350);
        this.StartPosition = FormStartPosition.CenterScreen;

        // Create TabControl
        TabControl tabControl = new TabControl();
        tabControl.Size = new System.Drawing.Size(380, 200);
        tabControl.Location = new Point(10, 10);

        // Create Tabs
        TabPage systemTab = new TabPage("System Tweaks");
        TabPage advancedTab = new TabPage("Advanced Tweaks");
        TabPage cleanupTab = new TabPage("Cleanup");

        // System Tweaks Tab
        Button enableRPButton = new Button();
        enableRPButton.Text = "Enable System Restore";
        enableRPButton.Location = new Point(20, 40);
        enableRPButton.Size = new Size(160, 30);
        enableRPButton.Click += (sender, e) => {
            Enable-SystemRestore
        };
        systemTab.Controls.Add(enableRPButton);

        // Advanced Tweaks Tab
        Button gpuOptimizeButton = new Button();
        gpuOptimizeButton.Text = "Optimize GPU";
        gpuOptimizeButton.Location = new Point(20, 40);
        gpuOptimizeButton.Size = new Size(160, 30);
        gpuOptimizeButton.Click += (sender, e) => {
            Optimize-GPU
        };
        advancedTab.Controls.Add(gpuOptimizeButton);

        // Cleanup Tab
        Button cleanTempButton = new Button();
        cleanTempButton.Text = "Clean Temporary Files";
        cleanTempButton.Location = new Point(20, 40);
        cleanTempButton.Size = new Size(160, 30);
        cleanTempButton.Click += (sender, e) => {
            Clean-TempFiles
        };
        cleanupTab.Controls.Add(cleanTempButton);

        // Add Tabs to TabControl
        tabControl.TabPages.Add(systemTab);
        tabControl.TabPages.Add(advancedTab);
        tabControl.TabPages.Add(cleanupTab);

        // Add TabControl to Form
        this.Controls.Add(tabControl);

        // Create Exit Button
        Button exitButton = new Button();
        exitButton.Text = "Exit";
        exitButton.Location = new Point(120, 220);
        exitButton.Size = new Size(160, 30);
        exitButton.Click += (sender, e) => {
            this.Close();
        };
        this.Controls.Add(exitButton);
    }
}
"@ -Language CSharp
