
module.exports = (robot) ->

	robot.hear /blir sen (.*)/i, (res) ->
		minutes = res.match[1]
		reasons = ["Stötte på jultomten och behövde diskutera hur vi delar ut julklappar så jag kommer #{minutes} minuter sent!", "Blir #{minutes} minuter sen, behövde rasta hunden", "Kommer typ #{minutes} minuter sent för jag stötte på en björn på vägen", "Spelade bort alla pengar online igår så jag hade inget över till spårvagnen! #{minutes} min", "Blev tagen av utomjordingar men det går bra typ, kommer #{minutes} sent typ", "Jag blir inte sen men jag kommer #{minutes} minuter efter", "Jag testade gå en annan väg dit men det tog mycket längre så jag kommer sent", "Somnade i duschen, blir #{minutes} minuter sen!", "Hittade inte mina kläder, kommer typ #{minutes} minuter senare", "Trodde det blev sommartid idag så jag ställde klockan fel! Kommer #{minutes} sent"]

		res.send res.random reasons

