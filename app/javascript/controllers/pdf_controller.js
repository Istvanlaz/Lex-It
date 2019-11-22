import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [];

  initialize() {
    const box = this.element
    console.log(box)

    let url = JSON.parse(box.dataset.pdf)
    console.log(url)

    let pdfjsLib = window['pdfjs-dist/build/pdf'];

    pdfjsLib.GlobalWorkerOptions.workerSrc = '//mozilla.github.io/pdf.js/build/pdf.worker.js';

    var loadingTask = pdfjsLib.getDocument(url);
    console.log(loadingTask)

    loadingTask.promise.then(function(pdf) {
      console.log('PDF loaded');

      // Fetch the first page

      var pageNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

      pageNumbers.forEach((number) => {
        pdf.getPage(number).then(function(page) {
          console.log('Page loaded');

          var scale = 1.5;
          var viewport = page.getViewport({scale: scale});

          // Prepare canvas using PDF page dimensions
          var canvas = document.getElementById(`the-canvas-${number}`);
          console.log(canvas)
          var context = canvas.getContext('2d');
          canvas.height = viewport.height;
          canvas.width = viewport.width;

          // Render PDF page into canvas context
          var renderContext = {
            canvasContext: context,
            viewport: viewport
          };
          var renderTask = page.render(renderContext);
          renderTask.promise.then(function () {
            console.log('Page rendered');
          });
        });
      })
    }, function (reason) {
      // PDF loading error
      console.error(reason);
    });



  }

}
