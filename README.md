# ContainerSavesContainerInContainer


This will fix the issue that containers with containers inside (backpack inside backpack etc) inside containers/vehicles are vanishing on restart.

**Warning**: Since the data structure changes you need to either clear the current container and vehicle table, or set the to cargo_container field to an empty array [] for each vehicle/container.
Otherwise your server will not start, so Imho a change best situated for a wipe!

Before restart and putting the backpack into the vehicle.
![20EA98~1](https://github.com/user-attachments/assets/29401967-e8a1-4662-8782-1251f5587c7b)

After restart
![209081~1](https://github.com/user-attachments/assets/402962a2-59c1-4474-8634-9082b0f45e32)
