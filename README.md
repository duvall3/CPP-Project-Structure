# C++ Project Structure

---

TODO:
- [ ] Write a simple test
- [ ] Add test to Makefile

---

The Makefile will make the following folder structure:
* **bin**: for output executables (targets), both for the app and for any spikes and tests.
* **build**: for object/binary files created during compilation (this is removed by `make clean`).
* **doc**: for notes, configuration files and documentation.
* **include**: for the applications header files.
* **lib**: for any libraries that is compiled by the project.
* **resources**: for data files used by the executable.
* **scripts**: for scipts that can benefit the project (e.g. Python or bash scripts).
* **spike**: for smaller classes or files to test technologies or ideas.
* **src**: for the applications source files.
* **tests**: for all test code files.

#### Makefile commands
The following commands can be used with this Makefile:
* `make`
* `make all`
* `make build`
* `make clean`
* `make debug`
* `make release`
