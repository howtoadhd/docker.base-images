# Base images for HowToADHD
[![Travis](https://img.shields.io/travis/howtoadhd/docker.base-images.svg?style=for-the-badge)](https://travis-ci.org/howtoadhd/docker.base-images) [![GitHub stars](https://img.shields.io/github/stars/howtoadhd/docker.base-images.svg?label=Stars&style=for-the-badge)](https://github.com/howtoadhd/docker.base-images) [![Docker Stars](https://img.shields.io/docker/stars/howtoadhd/base-images.svg?style=for-the-badge)](https://hub.docker.com/r/howtoadhd/base-images/)

## Supported tags and respective Dockerfile links

| Images   | Branch | Tags                           | Dockerfile                                                                                          |
|----------|--------|--------------------------------|-----------------------------------------------------------------------------------------------------|
| alpine   | master | latest-alpine, master-alpine   | [Dockerfile](https://github.com/howtoadhd/docker.base-images/blob/master/images/alpine/Dockerfile)  |
| nginx    | master | latest-nginx, master-nginx     | [Dockerfile](https://github.com/howtoadhd/docker.base-images/blob/master/images/nginx/Dockerfile)   |
| php-cli  | master | latest-php-cli, master-php-cli | [Dockerfile](https://github.com/howtoadhd/docker.base-images/blob/master/images/php-cli/Dockerfile) |
| php-fpm  | master | latest-php-fpm, master-php-fpm | [Dockerfile](https://github.com/howtoadhd/docker.base-images/blob/master/images/php-fpm/Dockerfile) |

## Containers

### Alpine

Alpine Linux is a Linux distribution built around musl libc and BusyBox. The image is only 5 MB in size and has access to a package repository that is much more complete than other BusyBox based images. This makes Alpine Linux a great image base for utilities and even production applications. Read more about Alpine Linux here and you can see how their mantra fits in right at home with Docker images.

<details>
	<summary>Changes from Alpine 3.7</summary>
	<table>
		<tr>
			<th>Change</th>
			<th>Value</th>
		</tr>
		<tr>
			<td>CMD</td>
			<td>/bin/bash</td>
		</tr>
		<tr>
			<td>User</td>
			<td>app</td>
		</tr>
		<tr>
			<td>Workdir</td>
			<td>/app</td>
		</tr>
		<tr>
			<td>Groups</td>
			<td>
				<table>
					<tr>
						<th colspan=2>app</th>
					</tr>
					<tr>
						<td>UID</td>
						<td>83</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>Packages</td>
			<td>
				<table>
					<tr>
						<td>bash</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>Users</td>
			<td>
				<table>
					<tr>
						<th colspan=2>root</th>
					</tr>
					<tr>
						<td>Default Shell</td>
						<td>/bin/bash</td>
					</tr>
				</table>
				<table>
					<tr>
						<th colspan=2>app</th>
					</tr>
					<tr>
						<td>Default Shell</td>
						<td>/sbin/nologin</td>
					</tr>
					<tr>
						<td>Home Dir</td>
						<td>/app</td>
					</tr>
					<tr>
						<td>Primary Group</td>
						<td>app</td>
					</tr>
					<tr>
						<td>UID</td>
						<td>83</td>
					</tr>
				</table>
				<table>
					<tr>
						<th colspan=2>www-data</th>
					</tr>
					<tr>
						<td>Default Shell</td>
						<td>/sbin/nologin</td>
					</tr>
					<tr>
						<td>Home Dir</td>
						<td>/app/www</td>
					</tr>
					<tr>
						<td>Primary Group</td>
						<td>app</td>
					</tr>
					<tr>
						<td>UID</td>
						<td>82</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</details>

### Nginx

Nginx (pronounced "engine-x") is an open source reverse proxy server for HTTP, HTTPS, SMTP, POP3, and IMAP protocols, as well as a load balancer, HTTP cache, and a web server (origin server). The nginx project started with a strong focus on high concurrency, high performance and low memory usage. It is licensed under the 2-clause BSD-like license and it runs on Linux, BSD variants, Mac OS X, Solaris, AIX, HP-UX, as well as on other *nix flavors. It also has a proof of concept port for Microsoft Windows.

<details>
	<summary>Changes from Alpine (above)</summary>
	<table>
		<tr>
			<th>Change</th>
			<th>Value</th>
		</tr>
		<tr>
			<td>CMD</td>
			<td>nginx</td>
		</tr>
		<tr>
			<td>Entrypoint</td>
			<td>docker-nginx-entrypoint</td>
		</tr>
		<tr>
			<td>Exposed Ports</td>
			<td>80/tcp</td>
		</tr>
		<tr>
			<td>User</td>
			<td>root</td>
		</tr>
	</table>
</details>

### PHP CLI

PHP is a server-side scripting language designed for web development, but which can also be used as a general-purpose programming language. PHP can be added to straight HTML or it can be used with a variety of templating engines and web frameworks. PHP code is usually processed by an interpreter, which is either implemented as a native module on the web-server or as a common gateway interface (CGI).

For PHP projects run through the command line interface (CLI).

<details>
	<summary>Changes from Alpine (above)</summary>
	<table>
		<tr>
			<th>Change</th>
			<th>Value</th>
		</tr>
		<tr>
			<td>CMD</td>
			<td>php</td>
		</tr>
		<tr>
			<td>Entrypoint</td>
			<td>docker-nginx-entrypoint</td>
		</tr>
	</table>
</details>

### PHP FPM

PHP is a server-side scripting language designed for web development, but which can also be used as a general-purpose programming language. PHP can be added to straight HTML or it can be used with a variety of templating engines and web frameworks. PHP code is usually processed by an interpreter, which is either implemented as a native module on the web-server or as a common gateway interface (CGI).

For PHP projects run through the web server.

<details>
	<summary>Changes from Alpine (above)</summary>
	<table>
		<tr>
			<th>Change</th>
			<th>Value</th>
		</tr>
		<tr>
			<td>CMD</td>
			<td>php-fpm</td>
		</tr>
		<tr>
			<td>Entrypoint</td>
			<td>docker-php-entrypoint</td>
		</tr>
		<tr>
			<td>Exposed Ports</td>
			<td>9000/tcp</td>
		</tr>
		<tr>
			<td>User</td>
			<td>root</td>
		</tr>
	</table>
</details>

