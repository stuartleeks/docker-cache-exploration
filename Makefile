# TODO - add checks for CR_PAT and IMAGE_NAME (hint to set up terminal session)

docker-1-build-with-cachefrom:
	./scripts/docker/1-build-with-cachefrom.sh

docker-2-buildx-with-cachefrom:
	./scripts/docker/2-buildx-with-cachefrom.sh

docker-2a-buildx-BUILDKIT_INLINE_CACHE:
	./scripts/docker/2a-buildx-BUILDKIT_INLINE_CACHE.sh

docker-3-build-BUILDKIT_INLINE_CACHE:
	./scripts/docker/3-build-BUILDKIT_INLINE_CACHE.sh

docker-3a-build-BUILDKIT_INLINE_CACHE_new_tag:
	./scripts/docker/3a-build-BUILDKIT_INLINE_CACHE_new_tag.sh

docker-3b-build-BUILDKIT_INLINE_CACHE_derived_image:
	./scripts/docker/3b-build-BUILDKIT_INLINE_CACHE_derived_image.sh

docker-4-buildx-BUILDKIT_INLINE_CACHE_derived_image:
	./scripts/docker/4-buildx-BUILDKIT_INLINE_CACHE_derived_image.sh

docker-4a-buildx-derived_image_inline-max:
	./scripts/docker/4a-buildx-derived_image_inline-max.sh

docker-5-buildx-multistage_image_inline-max:
	./scripts/docker/5-buildx-multistage_image_inline-max.sh

docker-5a-buildx-multistage_image_inline-max-retag:
	./scripts/docker/5a-buildx-multistage_image_inline-max-retag.sh

docker-5b-buildx-multistage_image-retag:
	./scripts/docker/5b-buildx-multistage_image-retag.sh

docker-5c-buildx-BUILDKIT_INLINE_CACHE-multistage_image-retag:
	./scripts/docker/5c-buildx-BUILDKIT_INLINE_CACHE-multistage_image-retag.sh

docker-5d-build-BUILDKIT_INLINE_CACHE-multistage_image-retag:
	./scripts/docker/5d-build-BUILDKIT_INLINE_CACHE-multistage_image-retag.sh

docker-6-buildx-BUILDKIT_INLINE_CACHE_derived_image_push_both:
	./scripts/docker/6-buildx-BUILDKIT_INLINE_CACHE_derived_image_push_both.sh

docker-6a-build-BUILDKIT_INLINE_CACHE_derived_image_push_both:
	./scripts/docker/6a-build-BUILDKIT_INLINE_CACHE_derived_image_push_both.sh

docker-6b-build-BUILDKIT_INLINE_CACHE_derived_image_push_both_ref_both:
	./scripts/docker/6b-build-BUILDKIT_INLINE_CACHE_derived_image_push_both_ref_both.sh




compose-1-start:
	./scripts/compose/1-start.sh
