Codebook
================

### Feature description

The features selected for this database come from the accelerometer and
gyroscope 3-axial raw signals t-acc_xyz and t-gyro_xyz. These time
domain signals (prefix ‘t’ to denote time) were captured at a constant
rate of 50 Hz. Then they were filtered using a median filter and a 3rd
order low pass Butterworth filter with a corner frequency of 20 Hz to
remove noise. Similarly, the acceleration signal was then separated into
body and gravity acceleration signals (t_body_acc_xyz and
t_gravity_acc_xyz) using another low pass Butterworth filter with a
corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were
derived in time to obtain Jerk signals (t-body_acc_jerk_xyz and
t-body_gyro_jerk_xyz). Also the magnitude of these three-dimensional
signals were calculated using the Euclidean norm (t-body_acc_mag,
t-gravity_acc_mag, t-body_acc_jerk_mag, t-body_gyro_mag,
t-body_gyro_jerk_mag).

Finally a Fast Fourier Transform (FFT) was applied to some of these
signals producing f-body_acc_xyz, f-body_acc_jerk_xyz, f-body_gyro_xyz,
f-body_acc_jerk_mag, f-body_gyro_mag, f-body_gyro_jerk_mag. (Note the
‘f’ to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for
each pattern: ’\_xyz’ is used to denote 3-axial signals in the X, Y and
Z directions.

The set of variables that were estimated from these signals are:

-   mean: Mean value
-   std: Standard deviation

Additional vectors obtained by averaging the signals in a signal window
sample:

-   t-body_acc_mag_mean  
-   t-gravity_acc_mag_mean  
-   t-body_acc_jerk_mag_mean
-   t-body_gyro_mag_mean  
-   t-body_gyro_jerk_mag_mean  
-   f-body_acc_mag_mean  
-   f-body_body_acc_jerk_mag_mean
-   f-body_body_gyro_mag_mean
-   f-body_body_gyro_jerk_mag_mean

The column subject contains the ID of the person who was wearing the
wearable and did the different activities.

The column activity contains information about the activities during the
respective measurement: LAYING, SITTING, STANDING, WALKING,
WALKING_DOWNSTAIRS, WALKING_UPSTAIRS.

### Dataset attributes

No. of rows: 180  
No. of columns: 68

| Variable                       | Class     | Minimum | Maximum | NAs |
|:-------------------------------|:----------|:--------|:--------|----:|
| subject                        | integer   | 1       | 30      |   0 |
| activity                       | character | NA      | NA      |   0 |
| t-body_acc_mean_x              | numeric   | 0.22    | 0.3     |   0 |
| t-body_acc_mean_y              | numeric   | -0.04   | 0       |   0 |
| t-body_acc_mean_z              | numeric   | -0.15   | -0.08   |   0 |
| t-body_acc_std_x               | numeric   | -1      | 0.63    |   0 |
| t-body_acc_std_y               | numeric   | -0.99   | 0.62    |   0 |
| t-body_acc_std_z               | numeric   | -0.99   | 0.61    |   0 |
| t-gravity_acc_mean_x           | numeric   | -0.68   | 0.97    |   0 |
| t-gravity_acc_mean_y           | numeric   | -0.48   | 0.96    |   0 |
| t-gravity_acc_mean_z           | numeric   | -0.5    | 0.96    |   0 |
| t-gravity_acc_std_x            | numeric   | -1      | -0.83   |   0 |
| t-gravity_acc_std_y            | numeric   | -0.99   | -0.64   |   0 |
| t-gravity_acc_std_z            | numeric   | -0.99   | -0.61   |   0 |
| t-body_acc_jerk_mean_x         | numeric   | 0.04    | 0.13    |   0 |
| t-body_acc_jerk_mean_y         | numeric   | -0.04   | 0.06    |   0 |
| t-body_acc_jerk_mean_z         | numeric   | -0.07   | 0.04    |   0 |
| t-body_acc_jerk_std_x          | numeric   | -0.99   | 0.54    |   0 |
| t-body_acc_jerk_std_y          | numeric   | -0.99   | 0.36    |   0 |
| t-body_acc_jerk_std_z          | numeric   | -0.99   | 0.03    |   0 |
| t-body_gyro_mean_x             | numeric   | -0.21   | 0.19    |   0 |
| t-body_gyro_mean_y             | numeric   | -0.2    | 0.03    |   0 |
| t-body_gyro_mean_z             | numeric   | -0.07   | 0.18    |   0 |
| t-body_gyro_std_x              | numeric   | -0.99   | 0.27    |   0 |
| t-body_gyro_std_y              | numeric   | -0.99   | 0.48    |   0 |
| t-body_gyro_std_z              | numeric   | -0.99   | 0.56    |   0 |
| t-body_gyro_jerk_mean_x        | numeric   | -0.16   | -0.02   |   0 |
| t-body_gyro_jerk_mean_y        | numeric   | -0.08   | -0.01   |   0 |
| t-body_gyro_jerk_mean_z        | numeric   | -0.09   | -0.01   |   0 |
| t-body_gyro_jerk_std_x         | numeric   | -1      | 0.18    |   0 |
| t-body_gyro_jerk_std_y         | numeric   | -1      | 0.3     |   0 |
| t-body_gyro_jerk_std_z         | numeric   | -1      | 0.19    |   0 |
| t-body_acc_mag_mean            | numeric   | -0.99   | 0.64    |   0 |
| t-body_acc_mag_std             | numeric   | -0.99   | 0.43    |   0 |
| t-gravity_acc_mag_mean         | numeric   | -0.99   | 0.64    |   0 |
| t-gravity_acc_mag_std          | numeric   | -0.99   | 0.43    |   0 |
| t-body_acc_jerk_mag_mean       | numeric   | -0.99   | 0.43    |   0 |
| t-body_acc_jerk_mag_std        | numeric   | -0.99   | 0.45    |   0 |
| t-body_gyro_mag_mean           | numeric   | -0.98   | 0.42    |   0 |
| t-body_gyro_mag_std            | numeric   | -0.98   | 0.3     |   0 |
| t-body_gyro_jerk_mag_mean      | numeric   | -1      | 0.09    |   0 |
| t-body_gyro_jerk_mag_std       | numeric   | -1      | 0.25    |   0 |
| f-body_acc_mean_x              | numeric   | -1      | 0.54    |   0 |
| f-body_acc_mean_y              | numeric   | -0.99   | 0.52    |   0 |
| f-body_acc_mean_z              | numeric   | -0.99   | 0.28    |   0 |
| f-body_acc_std_x               | numeric   | -1      | 0.66    |   0 |
| f-body_acc_std_y               | numeric   | -0.99   | 0.56    |   0 |
| f-body_acc_std_z               | numeric   | -0.99   | 0.69    |   0 |
| f-body_acc_jerk_mean_x         | numeric   | -0.99   | 0.47    |   0 |
| f-body_acc_jerk_mean_y         | numeric   | -0.99   | 0.28    |   0 |
| f-body_acc_jerk_mean_z         | numeric   | -0.99   | 0.16    |   0 |
| f-body_acc_jerk_std_x          | numeric   | -1      | 0.48    |   0 |
| f-body_acc_jerk_std_y          | numeric   | -0.99   | 0.35    |   0 |
| f-body_acc_jerk_std_z          | numeric   | -0.99   | -0.01   |   0 |
| f-body_gyro_mean_x             | numeric   | -0.99   | 0.47    |   0 |
| f-body_gyro_mean_y             | numeric   | -0.99   | 0.33    |   0 |
| f-body_gyro_mean_z             | numeric   | -0.99   | 0.49    |   0 |
| f-body_gyro_std_x              | numeric   | -0.99   | 0.2     |   0 |
| f-body_gyro_std_y              | numeric   | -0.99   | 0.65    |   0 |
| f-body_gyro_std_z              | numeric   | -0.99   | 0.52    |   0 |
| f-body_acc_mag_mean            | numeric   | -0.99   | 0.59    |   0 |
| f-body_acc_mag_std             | numeric   | -0.99   | 0.18    |   0 |
| f-body_body_acc_jerk_mag_mean  | numeric   | -0.99   | 0.54    |   0 |
| f-body_body_acc_jerk_mag_std   | numeric   | -0.99   | 0.32    |   0 |
| f-body_body_gyro_mag_mean      | numeric   | -0.99   | 0.2     |   0 |
| f-body_body_gyro_mag_std       | numeric   | -0.98   | 0.24    |   0 |
| f-body_body_gyro_jerk_mag_mean | numeric   | -1      | 0.15    |   0 |
| f-body_body_gyro_jerk_mag_std  | numeric   | -1      | 0.29    |   0 |
