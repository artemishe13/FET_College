        function openSearchModal() {
            document.getElementById("searchModal").style.display = "block";
        }

        function closeSearchModal() {
            document.getElementById("searchModal").style.display = "none";
        }

        window.onclick = function (event) {
            const searchModal = document.getElementById("searchModal");
            if (event.target == searchModal) {
                closeSearchModal();
            }
        }

        async function handleSearch(event) {
            if (event.keyCode === 13) {
                const query = document.getElementById('searchInput').value.trim();
                if (query) {
                    const response = await fetch(`../php/search_results.php?query=${encodeURIComponent(query)}`);
                    const results = await response.text();

                    document.getElementById('modalResults').innerHTML = results;
                    openSearchModal();
                }
            }
        }

        const imageModal = document.getElementById('imageModal');
        const modalImg = document.getElementById("img01");
		const modalContainer = document.getElementById("modalContainer");

        function openModal(img) {
            modalImg.src = img.src;
            imageModal.style.display = "block";
        }

        function closeModal() {
            imageModal.style.display = "none";
        }
		
    imageModal.addEventListener('click', function(event) {
        if (event.target === imageModal) {
            closeModal();
        }
    });
	
 document.getElementById("modalContainer").addEventListener("click", function(event) {
            if (event.target === modalContainer) {
                closeModal();
            }
        });