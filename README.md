# repo to test docker build cache


## Setup

Create a GitHub token with:
- `repo`
- `read:org`
- `delete:packages`
- `write:packages`

Store that token in the `CR_PAT` environment variable in your terminal session: `export CR_PAT=YOUR_TOKEN_FROM_GITHUB`

Run the following commands (Note: there are references to the image name in `test-image/Dockerfile-features` that aren't yet parameterised)

```bash
export IMAGE_BASE_NAME=test-docker-cache
export IMAGE_NAME=ghcr.io/stuartleeks/$IMAGE_BASE_NAME

# Set up registry auth
# Assumes that you have run the following in your terminal session: export CR_PAT=YOUR_TOKEN_FROM_GITHUB
echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin

# Set up gh cli auth
echo $CR_PAT | gh auth login  --with-token
```

To run a test, run `make <name>`, e.g. `make 5d-build-BUILDKIT_INLINE_CACHE-multistage_image-retag`.


## Summary - Docker

- `docker build` doesn't work with just `--cache=from` (same for `buildx`)
- `docker build` does work if the build/pushed image was built with `--build-arg BUILDKIT_INLINE_CACHE=1` (same for `buildx`) => Need to be able to set this
- `docker build[x]` seem to fail if building `image1` then `image2` based off it and pushing `image2`
- `docker build[x]` works with multistage build (all layers are used in cache)

## Notes - Docker

This section walks through the various tests. Each section corresponds to the scripts with the matching number, i.e. `notes-3` discusses the scripts `3*.sh`.

### Notes-1

Single build step
`docker build` specifying `--cache-from` - not successful

### Notes-2

`docker buildx` specifying `--cache-from` - not successful

2a added `--build-arg BUILDKIT_INLINE_CACHE=1` which _was_ successful.

### Notes-3

3 added `--build-arg BUILDKIT_INLINE_CACHE=1` to the approach from 1, and _was_ successful.
3a added a re-tagging step and was still successful

3b added a step to derive an image from the first step to mimic container-features and this _was not_ successful

## Notes-4

4 attempted the same as 3b, but with buildx - _not_ successful

4a tried the `mode=max` option for specifying the cache output settings, but still _not_ successful

## Notes-5

5 explores the same two stages as 3b and 4, but as a multistage build (single `Dockerfile`) and this _was_ successful
5a added in re-tagging and was still successful
5b was the same as 5a but without the `mode=max` option and was still successful
5c reverted to the `--build-arg BUILDKIT_INLINE_CACHE=1` approach and was still successful
5d switched to `docker build` and was still successful


## Notes-6

6 returns to 4, but pushes both the `image` and `image-features` images. This _was_ successful.
6a is the same as 6 but with `build` rather than `buildx`. This was also successful.


## misc


https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry#authenticating-to-the-container-registry
https://docs.github.com/en/packages/learn-github-packages/configuring-a-packages-access-control-and-visibility
https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token


# bug in gh api to delete package
https://github.com/cli/cli/issues/3937



