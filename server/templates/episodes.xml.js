var Template = function() { return `<?xml version="1.0" encoding="UTF-8" ?>
  <document>
    <catalogTemplate> 
      <banner> 
        <title>The Big Bang Theory</title>
      </banner>
      <list> 
        <section> 
				  <listItemLockup> 
				    <title>Season 1</title>
				    <decorationLabel>2</decorationLabel>
				    <relatedContent> 
				      <grid>
				        <section> 
								  <lockup videoURL="${this.BASEURL}videos/1.mp4">
								    <img src="${this.BASEURL}images/1.png" width="500" height="308" />
								  </lockup>
							          <lockup videoURL="${this.BASEURL}videos/2.mp4">
								    <img src="${this.BASEURL}images/2.png" width="500" height="308" />
								  </lockup>									
								</section>
				      </grid>
				    </relatedContent>
				  </listItemLockup>
<listItemLockup>
                                    <title>Season 2</title>
                                    <decorationLabel>2</decorationLabel>
                                    <relatedContent>
                                      <grid>
                                        <section>
                                                                   <lockup videoURL="${this.BASEURL}videos/3.mp4">
                                                                    <img src="${this.BASEURL}images/3.png" width="500" height="308" />
                                                                  </lockup>
                                                                    <lockup videoURL="${this.BASEURL}videos/4.mp4">
                                                                        <img src="${this.BASEURL}images/4.png" width="500" height="308" />
                                                                  </lockup>
                                                                </section>
                                      </grid>
                                    </relatedContent>
                                  </listItemLockup>
        </section>
      </list>
    </catalogTemplate>
  </document>`
}
