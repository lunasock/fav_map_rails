// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets

var map;
function initMap(){
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 35.6628611, lng: 139.6972762},
    zoom: 16,
    mapTypeControl: false,
    streetViewControl: false,
    fullscreenControl: false,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    // JSONで地図をカスタマイズ
    styles: [
      {
        "featureType": "poi.business",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      },
      {
        "featureType": "poi.school",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      },
      {
        "featureType": "poi.school",
        "elementType": "labels.text",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      }
    ]
  });

  // GoogleMapデフォルトの情報ウィンドウを非表示に
  // 特定のウィンドウを表示させるには noSuppress = true をオプションで指定
  var set;
  (function fixInfoWindow() {
      set = google.maps.InfoWindow.prototype.set;
      google.maps.InfoWindow.prototype.set = function(key, val) {
          if (key === "map") {
              if (! this.get("noSuppress")) {
                  return;
              }
          }
          set.apply(this, arguments);
      }
  })();  

  // eはイベントオブジェクト
  // e.latLngでクリック地点の緯度経度
  map.addListener('click', function(e){
    // クリック地点にピンを描画
    getClickLatLng(e.latLng, map);
    // 逆ジオコーディング
    reverse(e.latLng);
  });

  ramen();
  beer();
  coffee();
  livehouse();
  parking();
  place();
  getGeolocation();
  setInterval(getGeolocation, 500);   
};

  // クリック地点にピンを描画
  var searchBtn;
  var livehouseBtn;
  var marker;
  function getClickLatLng(lat_lng, map) {
    
    // 情報ウィンドウを閉じる
    infoWindowRamen.forEach((value) => {
        value.close()
      });
      infoWindowBeer.forEach((value2) => {
        value2.close()
      });
      infoWindowCoffee.forEach((value3) => {
        value3.close()
      });
      infoWindowParking.forEach((value4) => {
        value4.close()
      });
      infoWindowPlace.forEach((value5) => {
        value5.close()
      });
      infoWindowLivehouse.forEach((value6) => {
        value6.close()
      });
    
    // 検索ボタンの押下時にピンを削除
    searchBtn = document.getElementById('search-btn');
    searchBtn.addEventListener('click', function() {
      if(marker){
        marker.setMap(null);
      }
    });

    livehouseBtn = document.getElementById("livehouse-search-btn")
    livehouseBtn.addEventListener('click', function(){
      if(marker){
        marker.setMap(null);
      }
      $('#lat').val(null);
      $('#lng').val(null);
      $('#address_field').val(null)
      $('#address-area').html("<br>");
    });

    //既にピンが描画済みの場合、それを削除 
    if(marker){
      marker.setMap(null);
    }
    
    // 座標をフォームに表示
    $('#lat').val(lat_lng.lat());
    $('#lng').val(lat_lng.lng());
  
  　// マーカーを設置
    marker = new google.maps.Marker({
    position: lat_lng,
    map: map,
    });

    // 座標の中心をずらす
    // Map.panTo()はMapクラスのメソッドです。地図の位置座標を絶対的に移動できます。
    // map.panTo(lat_lng);
  }

  // 住所による検索
  function codeAddress(){
    var inputAddress;
    var geocoder;

    if(marker){
        marker.setMap(null);
      }

    // 情報ウィンドウを閉じる
    infoWindowRamen.forEach((value) => {
      value.close()
    });
    infoWindowBeer.forEach((value2) => {
      value2.close()
    });
    infoWindowCoffee.forEach((value3) => {
      value3.close()
    });
    infoWindowParking.forEach((value4) => {
      value4.close()
    });
    infoWindowPlace.forEach((value5) => {
      value5.close()
    });
    infoWindowLivehouse.forEach((value6) => {
      value6.close()
    });

    geocoder = new google.maps.Geocoder()

    // 入力を取得
    inputAddress = document.getElementById('address').value;

    // geocodingしたあとmapを移動
    geocoder.geocode( { 'address': inputAddress}, function(results, status) {
      if (status == 'OK') {
        // map.setCenterで地図が移動
        map.setCenter(results[0].geometry.location);

        $('#lat').val(results[0].geometry.location.lat);
        $('#lng').val(results[0].geometry.location.lng);
        $('#address_field').val(results[0].formatted_address);
        $('#address-area').text(results[0].formatted_address);
        // google.maps.MarkerでGoogleMap上の指定位置にマーカが立つ
        marker = new google.maps.Marker({
            map: map,
            position: results[0].geometry.location
        });
      } else {
        alert('Geocode was not successful for the following reason: ' + status);
      }
    });
  }

  // 現在地取得
  var now = null;
  var nowMarker;
  var nowCircle;
  var now_image = "/images/now5.png";
  function getGeolocation(){
    navigator.geolocation.getCurrentPosition(
      function (pos) {
        if(nowMarker){
          console.log(0);
          nowMarker.setMap(null);
          nowMarker = null;
        }
        if(nowCircle){
          nowCircle.setMap(null);
          nowCircle = null;
        }
        var n  = new google.maps.LatLng(pos.coords.latitude,pos.coords.longitude)
        if(now == null){
          now = pos;
          moveGeolocation();
        }
        else{
          now = pos;
        }
        nowMarker = new google.maps.Marker({
          map: map,
          position: n,
          clickable: false,
          icon: now_image
        })
        nowCircle = new google.maps.Circle({
          map: map,
          center: n,
          clickable: false,
          radius: pos.coords.accuracy,
          strokeColor: '#0088ff',
          strokeOpacity: 0.1,
          strokeWeight: 1,
          fillColor: '#0088ff',
          fillOpacity: 0.1
        });
      }
    )
  } 

  // 現在地へ移動
  function moveGeolocation(){
    map.setCenter(new google.maps.LatLng(now.coords.latitude,now.coords.longitude));
  }

  // 逆ジオコーディング
  function reverse(lat_lng){
    var latlng;
    var geocoder;
    var address;  
      latlng = {lat: lat_lng.lat(), lng: lat_lng.lng()};
      geocoder = new google.maps.Geocoder();
      geocoder.geocode({
        latLng: latlng
      }, 
        function(results, status){
          if (status == google.maps.GeocoderStatus.OK && results[0].geometry) {
            address = results[0].formatted_address;
            $('#address_field').val(address);
            $('#address-area').text(address);
          }
        }
      )
    }