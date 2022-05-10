# TODO - add checks for CR_PAT and IMAGE_NAME (hint to set up terminal session)

1-build-with-cachefrom:
	./scripts/1-build-with-cachefrom.sh

2-buildx-with-cachefrom:
	./scripts/2-buildx-with-cachefrom.sh

2a-buildx-BUILDKIT_INLINE_CACHE:
	./scripts/2a-buildx-BUILDKIT_INLINE_CACHE.sh

3-build-BUILDKIT_INLINE_CACHE:
	./scripts/3-build-BUILDKIT_INLINE_CACHE.sh

3a-build-BUILDKIT_INLINE_CACHE_new_tag:
	./scripts/3a-build-BUILDKIT_INLINE_CACHE_new_tag.sh

3b-build-BUILDKIT_INLINE_CACHE_derived_image:
	./scripts/3b-build-BUILDKIT_INLINE_CACHE_derived_image.sh

4-buildx-BUILDKIT_INLINE_CACHE_derived_image:
	./scripts/4-buildx-BUILDKIT_INLINE_CACHE_derived_image.sh

4a-buildx-derived_image_inline-max:
	./scripts/4a-buildx-derived_image_inline-max.sh

5-buildx-multistage_image_inline-max:
	./scripts/5-buildx-multistage_image_inline-max.sh

5a-buildx-multistage_image_inline-max-retag:
	./scripts/5a-buildx-multistage_image_inline-max-retag.sh

5b-buildx-multistage_image-retag:
	./scripts/5b-buildx-multistage_image-retag.sh

5c-buildx-BUILDKIT_INLINE_CACHE-multistage_image-retag:
	./scripts/5c-buildx-BUILDKIT_INLINE_CACHE-multistage_image-retag.sh

5d-build-BUILDKIT_INLINE_CACHE-multistage_image-retag:
	./scripts/5d-build-BUILDKIT_INLINE_CACHE-multistage_image-retag.sh

6-buildx-BUILDKIT_INLINE_CACHE_derived_image_push_both:
	./scripts/6-buildx-BUILDKIT_INLINE_CACHE_derived_image_push_both.sh

6a-build-BUILDKIT_INLINE_CACHE_derived_image_push_both:
	./scripts/6a-build-BUILDKIT_INLINE_CACHE_derived_image_push_both.sh

6b-build-BUILDKIT_INLINE_CACHE_derived_image_push_both_ref_both:
	./scripts/6b-build-BUILDKIT_INLINE_CACHE_derived_image_push_both_ref_both.sh

