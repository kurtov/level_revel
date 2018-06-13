ymaps.ready(function () {
    var map = new ymaps.Map("map", {
      center: [55.76, 37.64],
      zoom: 11
    });

    map.events.add("click", function(event) {
        var coords = event.get("coords");
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "bars/near?longitude="+coords[1]+"&latitude="+coords[0]);
        xhr.setRequestHeader("Content-Type", "application/json");
        xhr.onload = function() {
            var tbody = document.getElementsByClassName("near")[0].tBodies[0];
            tbody.innerHTML = "";
            map.geoObjects.removeAll();
            if (xhr.status === 200) {
                JSON.parse(xhr.responseText).forEach(function(address) {
                    var row = tbody.insertRow(tbody.rows.length);
                    row.insertCell(0).innerHTML = tbody.rows.length;
                    row.insertCell(1).innerHTML = address.address;
                    row.insertCell(2).innerHTML = address.dist.toFixed(2);
                    map.geoObjects.add(new ymaps.Placemark([address.latitude, address.longitude], {
                        iconContent: tbody.rows.length
                    }));
                });
            } else {
                alert("Что-то пошло не так");
            }
        };
        xhr.send();
    });
});
