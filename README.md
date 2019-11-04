# Running label-maker from docker container

```
git clone https://github.com/Rub21/docker-label-maker.git
cd docker-label-maker/
docker-compose build
docker-compose up
```

*Note*
Make sure the config.json file should contain all the configurations.

### output

The output files will be located in the folder by default `/data`

## Working with diferente areas

There are some use cases where we need to evaluate different areas in the same country or city, For these case, we could add a files `bboxes.txt`   and put there the bboxes which we wan to evaluate: E.g: [bboxes.sample.txt](https://github.com/developmentseed/docker-label-maker/blob/master/bboxes.txt) and then the scripts will create  a folder of the country and the config file for each bbox.

E.g

```
peru_area1_labels.npz
peru_area1_classification.geojson
peru_area1_tiles
peru_area1_data.npz
```


