$(document).on('turbolinks:load', function() {
    // Initializes search overlay plugin.
    // Replace onSearchSubmit() and onKeyEnter() with
    // your logic to perform a search and display results
    $('[data-pages="search"]').search({
        searchField: '#overlay-search',
        closeButton: '.overlay-close',
        suggestions: '#overlay-suggestions',
        loadingIndicator: '.search-loading',
        brand: '.brand',
        onSearchSubmit: function(searchString) {
            console.log("Search for: " + searchString);
        },
        onKeyEnter: function(searchString) {
            console.log("Live search for: " + searchString);
            var searchField = $('#overlay-search');
            var searchResults = $('.search-results');
            var loadingIndicator = $('.search-loading');
            clearTimeout($.data(this, 'timer'));
            searchResults.fadeOut("fast");
            loadingIndicator.fadeIn("fast");

            var wait = setTimeout(function() {
                searchResults.find('.result-name').each(function() {
                    if (searchField.val().length != 0) {
                        $(this).html(searchField.val());
                        searchResults.fadeIn("fast");

                    }
                });
                loadingIndicator.fadeOut("fast");
            }, 1000);
            $(this).data('timer', wait);
        }
    });
});
//
// $(document).ready(function() {
//         // Initializes search overlay plugin.
//         // Replace onSearchSubmit() and onKeyEnter() with
//         // your logic to perform a search and display results
//         $('[data-pages="search"]').search({
//             searchField: '#overlay-search',
//             closeButton: '.overlay-close',
//             suggestions: '#overlay-suggestions',
//             brand: '.brand',
//             onSearchSubmit: function(searchString) {
//                 console.log("Search for: " + searchString);
//             },
//             onKeyEnter: function(searchString) {
//                 console.log("Live search for: " + searchString);
//                 var searchField = $('#overlay-search');
//                 var searchResults = $('.search-results');
//                 clearTimeout($.data(this, 'timer'));
//                 searchResults.fadeOut("fast");
//                 var wait = setTimeout(function() {
//                     searchResults.find('.result-name').each(function() {
//                         if (searchField.val().length != 0) {
//                             $(this).html(searchField.val());
//                             searchResults.fadeIn("fast");
//                         }
//                     });
//                 }, 500);
//                 $(this).data('timer', wait);
//             }
//         });
//     })