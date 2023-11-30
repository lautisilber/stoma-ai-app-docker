# stoma-ai-app-docker
A docker image to run StomaAI app

Link to the original project: https://github.com/XDynames/SAI-app

The image is uploaded to docker hub. You can run it with the command `docker run -p 8501:8501 lautisilber/stoma-ai-app`. Then open your internet browser and type `localhost:8501`

If you want to build the image yourself you can clone this repository (or download it). Inside this repository's folder type `docker build -t stoma-ai-app .`. To run it then type `docker run -p 8501:8501 stoma-ai-app`

##### For me:

I can build and publish the image to docker hub with the command `docker buildx build --push --platform linux/arm64,linux/amd64 --tag your-username/multiarch-example:buildx-latest .` from the tutorial in https://www.docker.com/blog/multi-arch-build-and-images-the-simple-way
