# qplant
App QPlant

# Planning 

- Dataset
  - https://www.tensorflow.org/datasets/catalog/plant_leaves
  - https://gitlab.inria.fr/cgarcin/plantnet_dataset
  - https://github.com/rodrigobressan/digipathos
  - https://www.kaggle.com/abdallahalidev/plantvillage-dataset

- Get new images for re-train
  - https://chrome.google.com/webstore/detail/download-all-images/ifipmflagepipjokmbdecpmjbibjnakm
  - Pre-processing:
    - Rename image using template: plant_name.jpg -> $ ls -v | cat -n | while read n f; do mv -n "$f" "$n.jpg"; done 
    - Remove incorrect images
    - Cut from image others objects

- Framework
  - Tensorflow lite: https://www.tensorflow.org/lite/examples?hl=pt-br
  - Transfer learning: https://www.tensorflow.org/tutorials/images/transfer_learning?hl=pt-br

- ML model
  - https://tfhub.dev/google/aiy/vision/classifier/plants_V1/1
  - Mobilenet_V2_1.0_224_quant ? : https://www.tensorflow.org/lite/guide/hosted_models?hl=pt-br

- Catalog of Plants
  - https://specieslist.sibbr.gov.br/speciesListItem/list/drt1573739671090
  - http://ipt.jbrj.gov.br/jbrj/resource?r=lista_especies_flora_brasil#downloads
  - https://www.gov.br/agricultura/pt-br/assuntos/sustentabilidade/recursos-geneticos-1/lista-de-plantas
  - http://floradobrasil.jbrj.gov.br/reflora/listaBrasil/ConsultaPublicaUC/ConsultaPublicaUC.do#CondicaoTaxonCP