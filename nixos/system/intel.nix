{
  # Enable OpenCL support
  # https://nixos.org/manual/nixos/stable/#sec-gpu-accel-opencl-intel
  hardware.graphics.extraPackages = [
    intel-compute-runtime
  ];
}
