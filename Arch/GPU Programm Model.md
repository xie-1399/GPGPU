### GPU Programming Model

------

#### 1：HardWare and Concept

GPU计算不是指单独的GPU计算，而是指CPU＋GPU的异构，一块单独的GPU是无法独立地完成所有计算任务的，它必须在CPU的调度下才能完成特定任务。在由CPU和GPU构成的异构计算平台中，通常将起控制作用的CPU称为主机（host）,将起加速作用的GPU称为设备（device），CPU和GPU之间通过PCIe总线连接，用于传递指令和数据

![img](https://face2ai.com/CUDA-F-1-1-%E5%BC%82%E6%9E%84%E8%AE%A1%E7%AE%97-CUDA/1.png)

**Cuda API**：驱动API是低级的API，使用相对困难，运行时API是高级API使用简单，其实现基于驱动API。这两种API是互斥的，也就是你只能用一个，两者之间的函数不可以混合调用，只能用其中的一个库。

![img](https://face2ai.com/CUDA-F-1-1-%E5%BC%82%E6%9E%84%E8%AE%A1%E7%AE%97-CUDA/5.png)

一个CUDA应用通常可以分解为两部分，即CPU 主机端代码、GPU 设备端代码，CUDA **nvcc** 编译器会自动分离你代码里面的不同部分，如主机代码用C写成，使用本地的C语言编译器编译，设备端代码，也就是核函数，用CUDA C编写，通过nvcc编译，链接阶段，在内核程序调用明显的GPU设备操作时，添加运行时库。

**Cuda程序分解**：一般在写Cuda代码时，主要从以下几个步骤开始：

```
1. 分配GPU内存
2. 拷贝内存到设备
3. 调用CUDA内核函数来执行计算
4. 把计算完成数据拷贝回主机端
5. 内存销毁
```

**Notice：** a simple demo is at hello.cu



#### 2：Programming Model

###### 线程管理

##### 一些可能让人比较头疼的概念：

（1）线程

（2）线程块

（3）线程网格

其实三者的关系这张图里体现的还是比较清晰的：（一个核函数只能有一个grid，一个grid可以有很多个块，每个块可以有很多的线程）

![img](https://face2ai.com/CUDA-F-2-0-CUDA%E7%BC%96%E7%A8%8B%E6%A8%A1%E5%9E%8B%E6%A6%82%E8%BF%B01/4.png)

但是需要注意的是，**不同块内线程不能相互影响！他们是物理隔离的！**

还要考虑的一个问题是如何给每个线程分配对应的一个编号，每个线程都执行同样的一段串行代码，但让这段相同的代码对应不同的数据

因此需要从两个维度去确定线程对应的位置：

- **blockIdx（线程块在线程网格内的位置索引）**（包含x,y,z）
- **threadIdx（线程在线程块内的位置索引）**（包含x,y,z)

网格和块的维度一般是二维和三维的，也就是说一个网格通常被分成二维的块，而每个块常被分成三维的线程。

```
（1〕blockIdx.x的取值范围是从0到gridDim.x-1 

（2）blockIdx.y的取值范围是从0到gridDim.y-1 

（3）blockIdx.z的取值范围是从0到gridDim.z-1 

（4）threadIdx.x的取值范围是从0到blockDim.x-1  

（5）threadIdx.y的取值范围是从0到blockDim.y-1 

（6）threadIdx.z的取值范围是从0到blockDim.z-1 
```

**Notice：**a simple demo is at dimension.cu

实际上,总的线程数大于计算核心数时才能更充分地利用GPU中的计算资源，因为这会让计算和内存访问之间及不同的计算之间合理地重叠，从而减小计算核心空闲的时间。一个核函数允许指派的线程数目是巨大的，以此来充分利用GPU的全部计算资源

如果出现多个维度时



###### 内存管理

内存管理在传统串行程序是非常常见的，寄存器空间，栈空间内的内存由机器自己管理，堆空间由用户控制分配和释放，CUDA程序同样，只是CUDA提供的API可以分配管理设备上的内存，当然也可以用CDUA管理主机上的内存，主机上的传统标准库也能完成主机内存管理。

| 标准C函数 | CUDA C 函数 |   说明   |
| :-------: | :---------: | :------: |
|  malloc   | cudaMalloc  | 内存分配 |
|  memcpy   | cudaMemcpy  | 内存复制 |
|  memset   | cudaMemset  | 内存设置 |
|   free    |  cudaFree   | 释放内存 |

CUDA提供的API可以分配管理设备上的内存，当然也可以用CDUA管理主机上的内存。一般包括上面这四种：

![img](https://face2ai.com/CUDA-F-2-0-CUDA%E7%BC%96%E7%A8%8B%E6%A8%A1%E5%9E%8B%E6%A6%82%E8%BF%B01/3.png)

**Notice：**a simple demo is at memory.cu



#### 3：Excute Model



#### 4：Memory Organization

