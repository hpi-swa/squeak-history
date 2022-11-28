normalization - support
rulesForAuthorKeyClarification
	"Use the mail address to expand short user names to clarify and correct their author key."

	^ rulesForAuthorKeyClarification ifNil: [rulesForAuthorKeyClarification := Dictionary newFrom:
		(#(('lars.wassermann@googlemail.com' 'lars' 'larswassermann')
		('lars@cymfony.com' 'lars' 'larsnilsson')
		
		('alberto@chiaroscuro.com' 'alberto' 'albertoberti')
		('andrew@beta4.com' 'andrew' 'andrewcatton')
		
		('a.kuckartz@lilly.ping.de' 'akuckartz' 'andreaskuckartz')
		
		('bert@freudenbergs.de' 'bert' 'vanessafreudenberg')
		('bert@isg.cs.uni-magdeburg.de' 'bert' 'vanessafreudenberg')
		('squeakland-forum@squeakland.org' 'bert' 'vanessafreudenberg')
		('etoys-dev-forum@squeakland.org' 'bert' 'vanessafreudenberg')
		
		('tim@io.com' 'tim' 'timolson')
		('tim@nada1.de' 'tim' 'timfelgentreff')
		('tim@rowledge.org' 'tim' 'timrowledge')
		('tim@sumeru.stanford.edu' 'tim' 'timrowledge')
		('tyguy11@mindspring.com' 'tim' 'timwill')
		
		('squeak414@free.fr' ('squeak' 'stan') 'stanshepherd')
		('squeak@vanrooijen.com' 'squeak' 'petervanrooijen')
		('squeak1@continentalbrno.cz' 'squeak' 'pavelkrivanek')
		
		('ducasse@iam.unibe.ch' ('sd' 'andrewblackvia') 'stephaneducasse')
		
		('chris.schreiner@online.no' 'chris' 'chrispatrickschreiner')
		('chris@chrisburkert.de' 'chris' 'chrisburkert')
		('chris@funkyobjects.org' 'chris' 'chrismuller')
		('cunningham.cb@gmail.com' 'chris' 'chriscunningham')
		('intern_boy_chris@yahoo.com' 'chris' 'satelliteboy') "???"
		
		('casey_damess@cox.net' 'casey' 'caseydamess')
		('catgame@gmail.com' 'cg' 'catgame') "???"
		('cg@tric.nl' 'cg' 'ceesdegroot')
		('cg@cdegroot.com' 'cg' 'ceesdegroot')
		
		('dnorton@mindspring.com' 'dan' 'dannorton') "???"
		('mr.d.poon@gmail.com' 'dan' 'danielpoon')

		('aikidave@gmail.com' 'dave' 'akidave') "???"
		('dave@bedarra.com' 'dave' 'davethomasbedarra')
		('dave_and_laura_lowry@mac.com' 'dave' 'davelowry')
		
		('david@myth.sdsu.edu' 'david' 'davidsalamon')
		('deanmao@cc.gatech.edu' 'dino' 'deanpumao')
		
		('eliot@parcplace.com' 'eliot' 'eliotmiranda')
		
		('frank@angband.za.org' 'frank' 'frankshearar')
		('frank@canyon-medical.com' 'frank' 'franksergeant')
		('frank@crystal-objects.com' 'frank' 'frankcaggiano')
		
		('grit@impara.de' 'grit' 'gritschuster')
		('goran@krampe.se' 'goran' 'goerankrampe')
		
		('henrik@ekenberg.org' 'henrik' 'henrikekenberg')
		('hh2@lexdb.net' 'hh' 'hanneshirzel')
		
		('jp1660@att.net' 'john' 'johnpfersich')
		('wiljo@mac.com' 'john' 'johnsarkela')
		('jason.johnson.081@gmail.com' 'jj' 'jasonjohnson')
		('jj@objectsroot.com' 'jj' 'giovannigiorgi') "Ha! Ha!"
		
		('keith_hodges@yahoo.co.uk' 'keith' 'keithhodges')
		('keithy@consultant.com' 'keith' 'keithhodges')
		
		('leo@smalltalking.net' 'leo' 'leodemarco')
		('lex@lnx-1.theinternetone.net' 'lex' 'lexspoon')
		('lex@cc.gatech.edu' 'lex' 'lexspoon')
		
		('demonfoxkyubi@gmail.com' 'max' 'demonfoxkyubi') "???"
		
		('marcel@metaobject.com' 'marcel' 'marcelweiher')
		('marcus@ira.uka.de' 'marcus' 'marcusdenker')
		
		('mail@marco-paga.de' 'mail' 'marcopaga')
		('mailinglist.fischer@bluewin.ch' 'mailinglist' 'alainfischer')
		
		('michal-list@auf.net' 'michal' 'michalstarke')
		('miso.fastlist@auf.net' 'michal' 'michalstarke') "???"
		
		('ned@bike-nomad.com' 'ned' 'nedkonz')
		('ned@squeakland.org' 'ned' 'nedkonz')
		
		('petton.nicolas@gmail.com' 'nico' 'nicolaspetton')
		('nperigoi@etu.info.unicaen.fr' 'nico' 'nperigoi') "???"
		
		('ok@cs.otago.ac.nz' 'ok' 'richardaokeefe')
		
		('shouse.patrick@gmail.com' 'patrick' 'patrickshouse')
		('pbpublist@gmail.com' 'phil' 'philb') " Phil B is not Philippe Back "
		
		('ret@deltanet.com' 'rick' 'rickthomas')
		('cubsno1@gmail.com' 'rick' 'rickhedin')
		('ricardosbc@netwave.com.br' 'rick' 'ricardosbc')
		
		('ritametzger@prodigy.net' 'rita' 'ritametzger')
		('rita@isg.cs.uni-magdeburg.de' 'rita' 'ritafreudenberg')
		('ritafreudenberg@googlemail.com' 'rita' 'ritafreudenberg')
		
		('r.a.lamb@att.net' 'robert' 'robertlamb')
		('robert.w.withers@gmail.com' 'robert' 'robertwithers')
		('charlie.robbats@gmail.com' 'charlierobbats' 'robertwithers')
		
		('kusasa@shuttleworthfoundation.org' 'sam' 'samchristie')
		('sam@rfc1149.net' 'sam' 'samueltardieu')
		
		('s@xss.de' 's' 'stefanschmiedl') "???"
		
		('sergio@village-buzz.com' 'sergio' 'sergioruiz')
		('sergiolist@village-buzz.com' 'sergio' 'sergioruiz')
		
		('stan@stanheckman.com' 'stan' 'stanheckman')
		('stephan@stack.nl' 'stephan' 'stephaneggermont')
		
		('sdw2@shineonline.co.nz' 'stephen' 'stephenwoolerton')
		('stephen@pairhome.net' 'stephen' 'stephenpair')
		('s_rowley@hotmail.com' 'stephen' 'stephenrowley') "???"
		
		('steve@daviesfam.org' 'steve' 'stephendavies')
		('steve@swerlingphoto.com' 'steve' 'stevenswerling')
		('sjg2001@mac.com' 'steve' 'stevegutierrez')
		
		('sven@dcs.uconn.edu' 'sven' 'svencrouse')
		
		('squeak@groucho.it' 'squeak' 'chobin') "???"
		('info@groucho.it' 'groucho' 'chobin') "???"
		
		('squeak@lisp-reader.hungry.com' 'squeak' 'lispreaderhungry') "???"
		('squeak@ursine.com' 'squeak' 'michaelbryan') 
		('squeak@oafamily.com' 'squeak' 'danielabeshouse') 
		('squeak@sysa.barnett.sk' 'squeak' 'janbarger')
		('squeak@ekenberg.org' 'squeak' 'henrikekenberg')
		('squeak@bike-nomad.com' 'squeak' 'nedkonz')
		('squeak@techscribe.com' 'squeak' 'joseph')
		
		('squeak@ajr.e4ward.com' 'squeak' 'alanreider')
		('ajr@e4ward.com' 'ajr' 'alanreider')
		('gmane-x9y9abu9r8@ajr.e4ward.com' 'ajr' 'alanreider')
		('squeakdev@reider.net' 'squeakdev' 'alanreider')
		('squeakdev1@reider.net' 'squeakdev1' 'alanreider')
		('ly4aegw02@sneakemail.com' 'ajr' 'alanreider') "!!!"
"		('sstnjpm02@sneakemail.com' ??? alanreider ???"
		
		('das.linux@gmx.de' 'tobias' 'tobiaspape')
		('thom@indiana.edu' 'thom' 'thomkevingillespie'))
			 collect: [:ea | ea first -> (ea second -> ea third)])]