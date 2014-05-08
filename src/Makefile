include ../../../../Makefile.inc

PDF = jiracards.pdf

all : $(PDF)

# get list of cards from a rapid board (e.g. JIRA Agile sprint)
sprint.json.tmp : 
	curl $(JIRA_URL)$(JIRA_RAPIDBOARD_ID) > sprint.json.tmp

# extract cards from the rapid board
cards.xml.tmp : 
	./rapidboardToCards -f sprint.json.tmp > cards.xml.tmp

# get data from an issues list in jira
issues.xml.tmp :
	curl $(JIRA_ISSUES_URL) > issues.xml.tmp

# extract cards from the jira issues list
cards2.xml.tmp : issues.xml.tmp
	./issuesToCards -f issues.xml.tmp > cards2.xml.tmp

%.fo.tmp : %.xml.tmp
	CLASSPATH="$(SAXON_JAR):$(CLASSPATH)" $(SAXON) -s:$< -xsl:jiracards.fo.xsl > $@

%.pdf : %.fo.tmp
	$(FOP) %< $@

test : $(PDF) 
	$(XDG-OPEN) $<

clean : 
	$(ECHO) cleaning up in .
	-$(RM) -f $(PDF)

