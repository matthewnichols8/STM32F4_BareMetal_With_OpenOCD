# STM32F4 Bare Metal with OpenOCD

This repository contains the necessary files to program an STM32F4 microcontroller board using OpenOCD. The setup includes a custom startup file, a Makefile, and a linker script, all tailored to facilitate the development and flashing process on the STM32F407VG Discovery Board. The main.c and main.h files are example code.

## Contents

- **STM32F407VG_startup.c**: The C-based startup file, which initializes the microcontroller before entering the main application code.
- **Makefile**: The build system that automates the process of compiling and linking the project. It is configured to work with OpenOCD to flash the STM32F4 board.
- **stm32_ls.ld**: The linker script that specifies memory layout and defines how the code should be placed in memory.

## Prerequisites

Before you begin, ensure that you have the following installed on your system:

- [GNU Arm Embedded Toolchain](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm)
- [OpenOCD](http://openocd.org/)
- [STM32CubeMX](https://www.st.com/en/development-tools/stm32cubemx.html) (Optional, for peripheral initialization)

Additionally, you'll need an STM32F4 development board and an appropriate JTAG/SWD debugger (e.g., ST-Link). I used ST-Link for this project.

## Getting Started

### Clone the Repository

To get started with the project, clone the repository to your local machine:

```bash
git clone https://github.com/yourusername/your-repo-name.git
cd your-repo-name
```

### Building the Project

1. Ensure that the `Makefile` is correctly set up for your system.
2. Run the following command to build the project:

   ```bash
   make
   ```

   This will compile the source files and create the output `.bin` or `.elf` file.

### Flashing the Firmware

To flash the firmware onto your STM32F4 board using OpenOCD, run the following command:

```bash
make flash
```

Make sure that your OpenOCD configuration is set up to communicate with your debugger (ST-Link or other). You may need to specify the correct interface and target in the OpenOCD config files.

### Debugging the Firmware

To start debugging your STM32F4 with OpenOCD, you can use GDB. First, start OpenOCD in a separate terminal:

```bash
openocd -f interface/stlink-v2.cfg -f target/stm32f4x.cfg
```

Then, in another terminal, run GDB:

```bash
arm-none-eabi-gdb build/your_project.elf
```

From GDB, connect to the target:

```bash
target remote :3333
```

You should now be able to set breakpoints, inspect memory, and step through your program.

## Folder Structure

```plaintext
├── Makefile                  # The makefile for building and flashing
├── stm32_ls.ld               # Linker script for STM32F4
├── STM32F407VG_startup.c     # C-based startup file
├── src/                      # Source code files
│   └── main.c                # Example application code
└── include/                  # Header files
    └── stm32f4xx.h           # STM32F4 specific headers
```

## Customization

- Modify the `Makefile` to adjust the build commands or add additional source files.
- Customize the `stm32_ls.ld` to match the specific memory layout for your STM32F4 model or application requirements.

## Troubleshooting

- If you encounter issues with OpenOCD not detecting the target, ensure that the debugger is properly connected and configured.
- Verify that your `Makefile` is pointing to the correct toolchain and OpenOCD configuration files.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
