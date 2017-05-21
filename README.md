# pixel-art-super-res
This was one of my first coding projects, all the way back in 2011. The objective of it was to enlarge pixel-art images in a "better" way than the simple nearest neighbor algorithm.

## Usage
The main function in the repository is [**pixelartsuperres.m**][main]. It takes as input an image and a super-resolution factor (it has to be a power of 2), and outputs an enlarged version of the input image, such that *size(output) = factor * size(input)*. **Warning**: this code can take a lot of time to run, especially if you use large images.

You can compare the result of the enlargement process with the regular nearest neighbor algorithm by running [**test_pixelartsuperres.m**][test]. Although our algorithm takes longer to run, we can see that our enlarged version is "smoother" than the one output by the standard nearest neighbor algorithm.

[main]: https://github.com/rodrigo-pena/pixel-art-super-res/blob/master/pixelartsuperres.m
[test]: https://github.com/rodrigo-pena/pixel-art-super-res/blob/master/test_pixelartsuperres.m
