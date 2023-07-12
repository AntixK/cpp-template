# C++ Template for Scientific Computing

## Getting Started

Build the dev environment

```
cd cpp-template
docker compose up --build -d
docker exec -it cpp bash
```

```
mkdir build && cd build/
cmake ..
make
```

## Goals
- Focus on header-only cpp libraries (and there are a lot of awesome header-only libs)
- Python binding (c'mon you know you'd need it)
- Beginner-friendly (no huge CMakeLists.txt monstrosities)
- (Optional) zig cc build

## TODO

- [x] CPM manager
- [ ] CMAKE compiler options (gcc / clang)
- [ ] valgrind and helgrind integration
- [ ] Minimalist docker dev environment
- [ ] clang format
- [ ] cppcheck
- [ ] Ccache integration
- [ ] pybind11 integration
- [ ] Enable or Disable cuda env
- [ ] Catch2 for testing


- https://github.com/fffaraz/awesome-cpp#standard-libraries
- https://github.com/p-ranav/awesome-hpp