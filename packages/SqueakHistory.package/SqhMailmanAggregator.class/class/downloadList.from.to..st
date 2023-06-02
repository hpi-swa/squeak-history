preparation
downloadList: listName from: urlToPiper to: localPath
	"The list name will be added as an extra directory to the local path."

	^ self downloadList: listName from: urlToPiper forMonthsThat: [:month | true] to: localPath
