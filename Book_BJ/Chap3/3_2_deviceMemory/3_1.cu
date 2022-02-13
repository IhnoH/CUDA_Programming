#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdio.h>

void checkDeviceMemory(void)
{
	size_t free, total;
	cudaMemGetInfo(&free, &total); // ���� ��밡���� device memory ũ���, �� device �޸� ũ�⸦ ������ �Լ�
	printf("Device memory (free/total) = %lld/%lld bytes\n"
		, free, total);
}

int main(void)
{
	int* dDataPtr;
	cudaError_t errorCode ;

	checkDeviceMemory();
	errorCode = cudaMalloc(&dDataPtr, sizeof(int) * 10240); // device memory �Ҵ�
	printf("cudaMalloc - %s\n", cudaGetErrorName(errorCode));
	checkDeviceMemory();

	errorCode = cudaMemset(dDataPtr, 0, sizeof(int) * 10240); // device memory �ʱ�ȭ
	printf("cudaMemset - %s\n", cudaGetErrorName(errorCode));

	errorCode = cudaFree(dDataPtr);
	printf("cudaFree - %s\n", cudaGetErrorName(errorCode)); // device memory ����
	checkDeviceMemory();
}