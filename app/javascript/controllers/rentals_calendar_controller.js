import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="rentals-calendar"
export default class extends Controller {
  static targets = [ "startDate", "endDate" ]

  connect() {
    const product_id = window.location.href.split('/').at(-1);

    fetch(`${product_id}/blocked_dates`, {
      method: 'GET',
      })
      .then(response => {
        if (!response.ok) {
          throw new Error('Network response was not ok');
        } else {
          return response.json()
        };
      })
      .then(data => {
        const intervals = [];
        data.forEach((item) => {
          intervals.push(
            {from: item.start_date, to: item.end_date}
          );
      })
        flatpickr(this.startDateTarget, { disable: intervals, dateFormat: "Y-m-d" });
        flatpickr(this.endDateTarget, { disable: intervals, dateFormat: "Y-m-d" });
      })
      .catch(error => {
        console.error('Error fetching data:', error);
      });
  }
}
