package com.chrisalla.solutions.ops;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;



public class Operations {

	private static ArrayList<String> tics;
	private static ArrayList<String> triggers;
	public static String textChoose;
	public static String HOME = System.getProperty("user.dir") + "/eclipse_workspace/WebQuirks/WebContent/WEB-INF/resources";
	// caution Home path hardcoded
	
	public String getQuirks(String language, String numberPlayers) {
		Operations ops = new Operations();
		// Set language default "de" and players default 1
			String lang = language == null? "de" : language;
		int players = numberPlayers == null? 1 : Integer.parseInt(numberPlayers.equals("")? "1" : numberPlayers);

		StringBuilder result = new StringBuilder();
		ArrayList<String> languages = ops.getLanguages();
		int langNumber = languages.indexOf(lang);
		String textPlayer = languages.get(langNumber + 1);
		String textWhen = languages.get(langNumber + 2);
		String textThen = languages.get(langNumber + 3);
		textChoose = languages.get(langNumber + 4);

		// Load full list from CSV file
		tics = ops.getTics(lang);
		triggers = ops.getTriggers(lang);

		for (int i = 1; i <= players; i++) {
			// Shuffle list order by random
			tics = shuffleList(tics);
			triggers = shuffleList(triggers);

			// Get random String and shorten List by one
			String tic = ops.getText(tics);
			String trigger = ops.getText(triggers);
			String output = textPlayer + " " + i + ": " + textWhen + " " + trigger + " " + textThen + " " + tic;

			result.append(output);
			if(i != players) {
				result.append(";");
			}


			if (tics.size() == 0) {
				tics = ops.getTics(lang);
			}

			if (triggers.size() == 0) {
				triggers = ops.getTriggers(lang);
			}

		}
		return result.toString();
	}

	private ArrayList<String> shuffleList(ArrayList<String> list) {
		ArrayList<String> result = new ArrayList<String>();
		int start = list.size();

		while (start > 0) {
			int random = (int) (Math.random() * list.size());
			result.add(list.get(random));
			list.remove(random);
			start--;
		}
		return result;
	}

	private String getText(ArrayList<String> list) {
		int random = (int) (Math.random() * list.size());
		String result = list.get(random);
		list.remove(random);
		return result;
	}

	private ArrayList<String> getTics(String lang) {
		ArrayList<String> result = CSVReader(HOME + "/csv/tics_" + lang + ".csv");

		return result;
	}

	private ArrayList<String> getTriggers(String lang) {
		ArrayList<String> result = CSVReader(HOME + "/csv/triggers_" + lang + ".csv");

		return result;
	}

	private ArrayList<String> getLanguages() {
		ArrayList<String> result = CSVReader(HOME + "/csv/languages.csv");

		return result;
	}

	private ArrayList<String> CSVReader(String file) {
		String line = "";
		String cvsSplitBy = ";";
		ArrayList<String> result = new ArrayList<String>();
		BufferedReader br = null;
		try {
			br = new BufferedReader(new FileReader(file));
			while ((line = br.readLine()) != null) {

				// use comma as separator
				String[] csv = line.split(cvsSplitBy);
				for (String x : csv) {
					result.add(x);
				}

			}

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

		}
		return result;
	}

}
