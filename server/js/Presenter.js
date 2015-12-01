var Presenter = {
	makeDocument: function(resource) {
		if (!Presenter.parser) {
			Presenter.parser = new DOMParser();
		}
		var doc = Presenter.parser.parseFromString(resource, "application/xml");
		return doc;
	},

	modalDialogPresenter: function(xml) {
		navigationDocument.presentModal(xml);
	},

	pushDocument: function(xml) {
		navigationDocument.pushDocument(xml);
	},

	setDocument: function(xml) {
		if(navigationDocument.documents.length){
		var oldDoc = navigationDocument.documents[navigationDocument.documents.length - 1];
			if(oldDoc.body == xml.body){
				return
			}else{
				navigationDocument.pushDocument(xml);	
			}
		}else{
			navigationDocument.pushDocument(xml);
		}
	},


	load: function(event) {
  	var self = this,
      	ele = event.target,
      	videoURL = ele.getAttribute("videoURL")
  	if(videoURL) {
	    var player = new Player();
	    var playlist = new Playlist();
	    var mediaItem = new MediaItem("video", videoURL);
	    
	    player.playlist = playlist;
	    player.playlist.push(mediaItem);
	    player.present();
  	}
	},
}