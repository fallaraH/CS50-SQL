# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

The Random Partioning approach is advantageous to maximize the storage of data sent by Aquabyte, since it evenly distributes the observations. However, this approach might also be more time consuming for the same reason.

## Partitioning by Hour

The Partioning by Hour approach is advantageous for saving time, since observations collected in the same period of the day are stored in the same boat. Yet, this approach doesn't garantee that data will be evenly distributed, so the storage limit of a certain boat can be exceeded.

## Partitioning by Hash Value

The Partioning by Hash Value approach is advantageous to facilitate querying for specific datum and to maximaze the storage of data at the same time. However, when it comes to query by conditions or groups, it might be more time consuming too.
