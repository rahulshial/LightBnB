$(() => {
  window.propertyListing = {};
  const createListing = function(property, isReservation) {
    // return
    const returnArticle = `
    <article class="property-listing">
        <section class="property-listing__preview-image">
          <img src="${property.thumbnail_photo_url}" alt="house">
        </section>
        <section class="property-listing__details">
          <h3 class="property-listing__title">${property.title}</h3>
          <ul class="property-listing__details">
            <li>number_of_bedrooms: ${property.number_of_bedrooms}</li>
            <li>number_of_bathrooms: ${property.number_of_bathrooms}</li>
            <li>parking_spaces: ${property.parking_spaces}</li>
          </ul>
          ${isReservation ?
    `<p>${moment(property.start_date).format('ll')} - ${moment(property.end_date).format('ll')}</p>`
    : ``}
          <footer class="property-listing__footer">
            <div class="property-listing__rating">${Math.round(property.average_rating * 100) / 100}/5 stars</div>
            <div class="property-listing__price">$${property.cost_per_night / 100.0}/night</div>
          </footer>
        </section>
        </article>
    `;
    const $form = $('<form>');
    const $propertyId = $('<input>').attr('name', 'property_id').attr('type', 'hidden').val(`${property.id}`);
    const $labelStart = $('<label>').text('Start:');
    const $start_date = $('<input>').attr('id', 'start_date').attr('name', 'start_date').attr('type', 'date');
    const $labelEnd = $('<label>').text('End:');
    const $end_date = $('<input>').attr('id', 'end_date').attr('name', 'end_date').attr('type', 'date');
    const $button = $('<button>').attr('id', 'Submit').attr('type', 'submit').html('Reserve');
    $form.append($propertyId, $labelStart, $start_date, $labelEnd, $end_date, $button);
    
    $form.on('submit', function(event) {
      event.preventDefault();
  
      const reservations = $(this).serialize();
      makeReservation(reservations)
        .then(() => {
          views_manager.show('listings');
        })
        .catch((error) => {
          console.error(error);
          views_manager.show('listings');
        });
    });
    return $(returnArticle).append($form);
  };
  
  window.propertyListing.createListing = createListing;


});
