#!/usr/bin/node

const axios = require('../node_modules/axios');

const colorize = (...args) => ({
	black: `\x1b[30m${args.join(' ')}`,
	red: `\x1b[31m${args.join(' ')}`,
	green: `\x1b[32m${args.join(' ')}`,
	yellow: `\x1b[33m${args.join(' ')}`,
	blue: `\x1b[34m${args.join(' ')}`,
	magenta: `\x1b[35m${args.join(' ')}`,
	cyan: `\x1b[36m${args.join(' ')}`,
	white: `\x1b[37m${args.join(' ')}`,
	bgBlack: `\x1b[40m${args.join(' ')}\x1b[0m`,
	bgRed: `\x1b[41m${args.join(' ')}\x1b[0m`,
	bgGreen: `\x1b[42m${args.join(' ')}\x1b[0m`,
	bgYellow: `\x1b[43m${args.join(' ')}\x1b[0m`,
	bgBlue: `\x1b[44m${args.join(' ')}\x1b[0m`,
	bgMagenta: `\x1b[45m${args.join(' ')}\x1b[0m`,
	bgCyan: `\x1b[46m${args.join(' ')}\x1b[0m`,
	bgWhite: `\x1b[47m${args.join(' ')}\x1b[0m`,
});

const arguments = process.argv.slice(2);
let url;
arguments.length === 0
	? (url = 'https://restcountries.eu/rest/v2/all')
	: (url = 'https://restcountries.eu/rest/v2/name/' + arguments.toString());

axios
	.get(url)
	.then(function(response) {
		const country = response.data.map((country) => {
			const language = country.languages.map((lang) => lang.name);
			return {
				name: country.name,
				capital: country.capital,
				region: country.region,
				subregion: country.subregion,
				demonym: country.demonym,
				flag: country.flag,
				cioc: country.cioc,
				language,
			};
		});
		console.log(JSON.stringify(country, null, 2));
	})
	.catch(function(error) {});
