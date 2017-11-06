#include <cuda.h>
#include <cuda_runtime.h>
#include <iostream>

#include <stdarg.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>


static const int DebugMode = 1;
static void debug_print(const char *format, ...) {
  if (!DebugMode)
    return;

  va_list args;
  va_start(args, format);
  vfprintf(stderr, format, args);
  va_end(args);
}
#define dump_function() debug_print("-> %s\n", __func__)

static void err_runtime() __attribute__((noreturn));
static void err_runtime() {
  fprintf(stderr, "Runtime not correctly initialized.\n");
  exit(-1);
}

int main() {
  dump_function();
  CUdevice Device;

  int Major = 0, Minor = 0, DeviceID = 0;
  char DeviceName[256];
  int DeviceCount = 0;


  if (cuInit(0) != CUDA_SUCCESS) {
    fprintf(stderr, "Initializing the CUDA driver API failed.\n");
    exit(-1);
  }

  /* Get number of devices that supports CUDA. */
  cuDeviceGetCount(&DeviceCount);
  if (DeviceCount == 0) {
    fprintf(stderr, "There is no device supporting CUDA.\n");
    exit(-1);
  }

  cuDeviceGet(&Device, 0);

  /* Get compute capabilities and the device name. */
  cuDeviceComputeCapability(&Major, &Minor, Device);
  cuDeviceGetName(DeviceName, 256, Device);
  debug_print("> Running on GPU device %d : %s.\n", DeviceID, DeviceName);

  CUcontext Context;

  cuCtxCreate(&Context, 0, Device);

    std::cout <<"hello, world";
    return 0;
}
